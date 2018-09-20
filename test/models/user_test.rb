require 'test_helper'

class UserTest < ActiveSupport::TestCase
   def setup
   	@user = User.new(email: "test@polygone.com", password: "testtest")
   end

  test "create user" do
     assert @user 
   end
end
