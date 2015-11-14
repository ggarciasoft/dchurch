require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(FullName: "Gregory Garcia", UserName: "ggarciaa", password: "aaaa", password_confirmation: "aaaa")
  end

  test "should be valid" do
    assert @user.valid?, @user.errors.messages
  end

  test "UserName should be unique" do
    @user.UserName="ggarcia"
    assert_not @user.valid?, @user.errors.messages
  end
end
