require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class SimpleTokenAuthGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def append_to_token_authenticatable_model
        inject_into_class "app/models/#{name}.rb", name.camelize.constantize, <<-END
  include SimpleTokenAuth::TokenAuthenticatable
END
      end
    end
  end
end
