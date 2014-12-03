require_relative 'simple_token_auth/configuration'
require_relative 'simple_token_auth/helpers'

module SimpleTokenAuth
  extend Configuration
  extend Helpers

  class << self
    def compare_token(a, b)
      compare_token_strategy.(a, b)
    end

    def generate_authentication_token
      generate_authentication_token_strategy.()
    end

    def find_scope(scope_class, token)
      find_scope_strategy.(scope_class, token)
    end

    def after_authenticated(scope, controller)
      after_authenticated_strategy.(scope, controller)
    end
  end
end

require_relative 'simple_token_auth/authenticate_with_token'
require_relative 'simple_token_auth/token_authenticatable'
