class Article < ApplicationRecord

	before_validation :set_slug

	validates :title, :content, presence: true

	belongs_to :user
	belongs_to :category, counter_cache: true, optional: true
	belongs_to :site

	has_many :comments
	has_many :seos
	has_many :one_articles

	has_many :tabs, as: :imageable

	def set_slug
		self.slug = title.parameterize if !self.title.nil? && !self.title.empty? && (self.slug.nil? || self.slug.empty?)
	end


	#has_and_belongs_to_many :categories
end
