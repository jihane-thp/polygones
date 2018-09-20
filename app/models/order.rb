class Order < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :products

	validates :price, presence: true
	validates :price, numericality: { greather_than_or_equal_to: 1 }

end
