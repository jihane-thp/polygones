class Template < ApplicationRecord

	has_many :pages
	belongs_to :site
	belongs_to :product

end
