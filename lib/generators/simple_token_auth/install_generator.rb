require 'rails/generators/base'

module SimpleTokenAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../../templates", __FILE__)

      desc "Generates a TokenAuth initializer and migrations for api_key"

      def self.orm
        Rails::Generators.options[:rails][:orm]
      end

      def self.orm_has_migration?
        [:active_record].include? orm
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migration_file
        if self.class.orm_has_migration?
          migration_template 'migration.rb', 'db/migrate/simple_token_auth_migration.rb'
        end
      end

      def copy_initializer
        template "simple_token_auth.rb", "config/initializers/simple_token_auth.rb"
      end

      def copy_api_key_model
        template "api_key.rb", "app/models/api_key.rb"
      end
    end
  end
end
