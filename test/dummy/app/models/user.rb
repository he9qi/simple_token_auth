class User < ActiveRecord::Base
  include SimpleTokenAuth::TokenAuthenticatable
end
