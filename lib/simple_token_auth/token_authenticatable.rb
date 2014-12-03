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
      before_save :ensure_api_key

      has_one :api_key, as: :token_authenticatable
    end

    def auth_token
      api_key.access_token
    end

    private

    def ensure_api_key
      build_api_key unless api_key.present?
    end
  end
end
