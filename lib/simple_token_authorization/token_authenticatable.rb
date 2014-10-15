# Ensures a token is generated
#
# class User < ActiveRecord::Base
#   include SimpleTokenAuthorization::TokenAuthenticatable
# end
#
module SimpleTokenAuthorization
  module TokenAuthenticatable
    extend ActiveSupport::Concern

    included do
      before_save :ensure_authentication_token
    end

    def ensure_authentication_token
      if authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    private

    def generate_authentication_token
      loop do
        token = SimpleTokenAuthorization.generate_authentication_token
        break token unless self.class.exists?(authentication_token: token)
      end
    end
  end
end
