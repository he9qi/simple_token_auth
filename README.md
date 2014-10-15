# SimpleTokenAuthorization

SimpleTokenAuthorization is mostly similar to `https://github.com/gonzalo-bulnes/simple_token_authentication`, but it uses Rails' `authenticate_or_request_with_http_token` method like it mentioned here: http://blog.envylabs.com/post/75521798481/token-based-authentication-in-rails.

## Usage

First, ensure you already have a model to apply token authentication to, for example, a User model.

### Setting up things

1. Run `bin/rails g simple_token_authentication:install` to create the initializer.
2. Run `bin/rails g simple_token_authentication user` to add token authentication field and make the user token authenticatable

The initializer likes like this:

```ruby
SimpleTokenAuthorization.configure do |config|
  # Make sure `find_scope_strategy` always return a tuple [scope, token]
  config.find_scope_strategy = -> (scope_class, token) do
    field, token = token.split('.')
    scope = scope_class.find(field.to_i)
    [scope, token]
  end

  config.after_authenticated_strategy = -> (scope, controller) do
    # If you are using Devise, this will set up `current_user` for us
    controller.sign_in scope, store: false
  end
end
```

### Authenticate with token

Now authenticate the user with token!

```
class ApplicationController
  include SimpleTokenAuthorization::AuthenticateWithToken
end

class UserController < ApplicationController
  prepend_before_action :authenticate_user_from_token!
end
```

## TODO

More test coverage (add integration tests)
