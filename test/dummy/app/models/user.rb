class User < ActiveRecord::Base
  include SimpleTokenAuthorization::TokenAuthenticatable
end
