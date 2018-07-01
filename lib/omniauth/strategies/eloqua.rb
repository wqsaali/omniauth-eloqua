require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Eloqua < OmniAuth::Strategies::OAuth2

      args [:client_id, :client_secret]

      option :name, "eloqua"
      option :provider_ignores_state, false

      option :client_options, {
        site: 'https://login.eloqua.com',
        authorize_url: '/auth/oauth2/authorize',
        token_url: '/auth/oauth2/token'
      }

      option :authorize_options, [
        :response_type,
        :client_id,
        :redirect_uri,
        :scope
      ]

      def request_phase
        redirect client.auth_code.authorize_url(
          {
            redirect_uri: "#{options[:redirect_uri]}?response_type=code&state="\
              "#{request.params['state']}"
          }.merge(
            options.authorize_params
          )
        )
      end

      def callback_phase
        error = request.params["error_reason"] || request.params["error"]
        if error
          fail!(error, CallbackError.new(request.params["error"],
            request.params["error_description"] ||
            request.params["error_reason"], request.params["error_uri"]))
        else
          conn = Faraday.new(:url => 'https://login.eloqua.com/auth/'\
            'oauth2/token') do |faraday|
              faraday.response :logger
              faraday.adapter  Faraday.default_adapter
          end

          token = Base64.strict_encode64("#{options.client_id.strip}:"\
            "#{options.client_secret.strip}").strip

          result = conn.post do |req|
            req.headers['Content-Type'] = 'application/json'
            req.headers['Authorization'] = "Basic #{token}"
            req.body = "{ 'grant_type': 'authorization_code', 'code': "\
              "'#{request.params["code"]}', 'redirect_uri': "\
              "'#{options[:redirect_uri]}?response_type=code&state="\
              "#{request.params['state']}' }"
          end

          result = JSON.parse(result.body)

          env['omniauth.auth'] = {
            credentials: {
              token: result["access_token"],
              refresh_token: result["refresh_token"],
              expires_in: result["expires_in"]
            }
          }
          call_app!
        end
      rescue ::OAuth2::Error, CallbackError => e
        fail!(:invalid_credentials, e)
      rescue ::Timeout::Error, ::Errno::ETIMEDOUT => e
        fail!(:timeout, e)
      rescue ::SocketError => e
        fail!(:failed_to_connect, e)
      end

      def auth_hash
        hash = AuthHash.new(:provider => name, :uid => uid)
        hash.info = info unless skip_info?
        hash.credentials = credentials if credentials
        hash
      end
    end
  end
end

OmniAuth.config.add_camelization 'eloqua', 'Eloqua'
