require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 #  def setup
	# @order = Order.new(theme:"uggly", price: "20")
 #  end	
    
    test 'valid order' do
    	order = Order.new
	
	assert @order.valid?
  end

 #   test "price should be present" do
	# @order.price = 20
	# assert @order.valid?
 #  end

end
