# Usage:
#
# class ApplicationController
#   include SimpleTokenAuth::AuthenticateWithToken
# end
#
# class UserController < ApplicationController
#   prepend_before_action :authenticate_user_from_token!
# end
#
module SimpleTokenAuth
  module AuthenticateWithToken
    def method_missing(method, *args, &block)
      if m = method.to_s.match(/authenticate_(.+)_from_token!/)
        send :authenticate_from_token!, m[1]
      else
        super
      end
    end

    private

    def authenticate_from_token!(scope_name)
      scope_class = scope_name.camelize.constantize
      authenticate_or_request_with_http_token do |token, options|
        return false if token.blank?

        scope, token  = *find_scope(scope_class, token)
        authenticated = false

        if scope
          api_key = scope.api_key
          authenticated = api_key && !api_key.expired? && compare_token(api_key.access_token, token)
        end

        after_authenticated(scope, self) if authenticated

        authenticated
      end
    end

    def after_authenticated(*args)
      SimpleTokenAuth.after_authenticated(*args)
    end

    def find_scope(*args)
      SimpleTokenAuth.find_scope(*args)
    end

    def compare_token(a, b)
      SimpleTokenAuth.compare_token(a, b)
    end
  end
end
