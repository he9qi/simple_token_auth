class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def sign_in(scope, opts)
    instance_variable_set("@current_user", scope)
  end
end
