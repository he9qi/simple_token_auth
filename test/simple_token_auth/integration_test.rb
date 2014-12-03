require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
  end

  test 'returns 401 when not authorized' do
    get :index, format: :json
    assert_response 401
    assert_nil assigns(:current_user)
  end

  test 'returns success when authorized' do
    user = User.create
    @request.headers["Authorization"] = "Token token=#{user.id}.#{user.auth_token}"
    get :index
    assert_response :success
    assert_not_nil assigns(:current_user)
  end

  test 'returns 401 when invalid token' do
    user = User.create
    @request.headers["Authorization"] = "Token token=#{user.id}.invalidtoken"
    get :index
    assert_response 401
    assert_nil assigns(:current_user)
  end

  test 'returns 401 when token is expired' do
    user = User.create
    @request.headers["Authorization"] = "Token token=#{user.id}.#{user.auth_token}"
    Timecop.freeze(4.hours.since) do
      get :index
      assert_response 401
      assert_nil assigns(:current_user)
    end
  end
end
