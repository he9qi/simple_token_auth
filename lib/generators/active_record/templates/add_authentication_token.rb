class SimpleTokenAuthorizationAddAuthenticationTokenTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    add_column :<%= table_name %>, :authentication_token, :string
    add_index  :<%= table_name %>, :authentication_token, unique: true
  end
end
