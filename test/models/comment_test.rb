require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
#   def setup
# 	@comment = Comment.new(content:"i like this article")
# end	  def setup
# 	@comment = Comment.new(content:"i like this article")
# end	
# test "content should be present" do
# 	@comment.content = "  rez   "
# 	assert_not @comment.valid?
# end
  	

  	  # test la condition valable d'un commentaire
  test 'valid comment' do
    content = Comment.new(content:'my string')
    assert content.valid?
  end 
  # def setup
  # 	@comment = Comment.new(content: "welcome")
  # end	
  # test 'valid comment' do
  # 	assert @comment.valid?
  # end	

  #test si une absence de commentaire
  # test 'invalid without comment' do
  # @comment.content = 'nil'
  # refute @comment.valid?
  # assert_not_nil @comment.errors[:content]

  end


