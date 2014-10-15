# SimpleTokenAuthorization

Simple and safe token authentication library that uses Rails' `authenticate_or_request_with_http_token` method

## Usage

First, ensure you already have a model to apply token authentication to, for example, a User model.

### Setting up things

1. Run `bin/rails g simple_token_authentication:install` to create the initializer.
2. Run `bin/rails g simple_token_authentication user` to add token authentication field and make the user token authenticatable

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
