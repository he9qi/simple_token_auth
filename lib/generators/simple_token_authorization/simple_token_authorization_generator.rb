require 'rails/generators/named_base'

module SimpleTokenAuthorization
  module Generators
    class SimpleTokenAuthorizationGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "simple_token_authorization"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates an identity model for the given NAME model"
      hook_for :orm
    end
  end
end
