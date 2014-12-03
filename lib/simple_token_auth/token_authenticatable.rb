# Ensures a token is generated
#
# class User < ActiveRecord::Base
#   include SimpleTokenAuth::TokenAuthenticatable
# end
#
module SimpleTokenAuth
  module TokenAuthenticatable
    extend ActiveSupport::Concern

    included do
      before_save :ensure_authentication_token

      has_one :api_key, as: :token_authenticatable
    end

    def auth_token
      api_key.authentication_token
    end
  end
end
