require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ensures an api key' do
    user = User.create
    assert_not_nil user.api_key
  end

  test 'renew an api key' do
    user = User.create
    Timecop.freeze(4.hours.since) do
      old_key = user.api_key.access_token
      user.renew_api_key
      assert_not_equal old_key, user.api_key.access_token
      assert !user.api_key.expired?
    end
  end
end
