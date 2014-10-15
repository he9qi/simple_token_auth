require 'rails/generators/base'

module SimpleTokenAuthorization
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a SimpleAuthorization initializer"

      def copy_initializer
        template "simple_token_authorization.rb",
          "config/initializers/simple_token_authorization.rb"
      end
    end
  end
end
