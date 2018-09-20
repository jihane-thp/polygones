require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

	#test 
	# test 'valid article' do
	# 	article = Article.new(title:'Poupidou', content: 'blabla blabla blabla ')
	# 	assert article.valid?
	# end	

	#test si une absence de titre
	test 'invalid without title' do
		comment =Article.new(title:'fez')
		assert_not comment.valid?
	end
	#test si une absence de contenu
	test 'invalid without content' do
		article =Article.new(content:'')
		assert_not article.valid?
	end

end
