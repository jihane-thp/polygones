require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # test la condition valable d'une categorie
  test 'valid category' do
    article = Category.new(title:'my string')
    assert article.valid?
  end 

  #test si une absence de titre
  test 'invalid without title' do
    article = Category.new(title:'  ')
    assert_not article.valid?
  end

end