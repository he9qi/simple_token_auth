SimpleTokenAuthorization.configure do |config|
  # Make sure `find_scope_strategy` always return a tuple [scope, token]
  config.find_scope_strategy = -> (scope_class, token) do
    field, token = token.split('.')
    scope = scope_class.find(field.to_i)
    [scope, token]
  end

  config.after_authenticated_strategy = -> (scope, controller) do
    # If you are using Devise, this will set up `current_user` for us
    controller.sign_in scope, store: false
  end
end
