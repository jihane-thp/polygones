class Page < ApplicationRecord
	belongs_to :menu
	belongs_to :template
end
