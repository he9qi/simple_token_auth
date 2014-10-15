require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class SimpleTokenAuthorizationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def add_authentication_token
        migration_template "add_authentication_token.rb",
         "db/migrate/simple_token_authorization_add_authentication_token_to_#{table_name}.rb"
      end

      def append_identities
        inject_into_class "app/models/#{name}.rb", name.camelize.constantize, <<-END
  include SimpleTokenAuthorization::TokenAuthenticatable
END
      end
    end
  end
end
