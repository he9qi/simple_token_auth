require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ensures an api key' do
    user = User.create
    assert_not_nil user.api_key
  end
end
