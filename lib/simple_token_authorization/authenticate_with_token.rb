# Usage:
#
# class ApplicationController
#   include SimpleTokenAuthorization::AuthenticateWithToken
# end
#
# class UserController < ApplicationController
#   prepend_before_action :authenticate_user_from_token!
# end
#
module SimpleTokenAuthorization
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
      scope_class = scope_name.capitalize.constantize
      authenticate_or_request_with_http_token do |token, options|
        return false if token.blank?
        scope, token = *find_scope(scope_class, token)
        authenticated = scope && compare_token(scope.authentication_token, token)
        after_authenticated(scope, self) if authenticated
        authenticated
      end
    end

    def after_authenticated(*args)
      SimpleTokenAuthorization.after_authenticated(*args)
    end

    def find_scope(*args)
      SimpleTokenAuthorization.find_scope(*args)
    end

    def compare_token(a, b)
      SimpleTokenAuthorization.compare_token(a, b)
    end
  end
end
