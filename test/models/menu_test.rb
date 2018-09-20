require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
	@menu = Menu.new(title:"accueil")
  end	
    
    test "title should be present" do
	@menu.title = "     "
	assert_not @menu.valid?
  end

end
