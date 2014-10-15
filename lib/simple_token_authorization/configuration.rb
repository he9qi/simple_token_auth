module SimpleTokenAuthorization
  module Configuration
    mattr_accessor :generate_authentication_token_strategy
    mattr_accessor :compare_token_strategy
    mattr_accessor :find_scope_strategy
    mattr_accessor :after_authenticated_strategy

    class MissingConfiguration
      def initialize(message)
        @message = message
      end

      def call(*args)
        raise NotImplementedError, @message
      end
    end

    # Defaults
    @@generate_authentication_token_strategy = -> { SimpleTokenAuthorization.friendly_token }
    @@compare_token_strategy                 = -> (a, b) { SimpleTokenAuthorization.secure_compare(a, b) }
    @@find_scope_strategy                    = MissingConfiguration.new("find_scope_strategy needs to be configured")
    @@after_authenticated_strategy           = MissingConfiguration.new("after_authenticated_strategy needs to be configured")

    def configure
      yield self if block_given?
    end
  end
end
