# Eloqua Strategy for OmniAuth

Eloqua OAuth2 strategy for OmniAuth.
## Get Started
```ruby
gem 'omniauth-eloqua'
```
## Usage

In your config/initializers/omniauth.rb:

    OmniAuth.config.logger = Rails.logger
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :eloqua, CLIENT_APP_ID, CLIENT_APP_SECRET
    end

If you want to put custom `redirect_uri`, pass it as params

    OmniAuth.config.logger = Rails.logger
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :eloqua, CLIENT_APP_ID, CLIENT_APP_SECRET, redirect_uri: 'SOME_URL'
    end

#License

Copyright (c) 2018 Waqas Ali

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
