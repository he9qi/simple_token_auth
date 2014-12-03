require 'rails/generators/named_base'

module SimpleTokenAuth
  module Generators
    class SimpleTokenAuthGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace 'simple_token_auth'
      source_root File.expand_path("../templates", __FILE__)

      desc 'Insert include for given NAME model'
      hook_for :orm
    end
  end
end
