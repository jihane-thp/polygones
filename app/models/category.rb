class Category < ApplicationRecord

	before_validation :set_slug, :uniqueless_category_slug
	validates :title, presence: true
	validates :slug, format: {with: /\A[a-z0-9\-]+\z/}

	has_many :tabs, as: :imageable

	has_many :multi_articles

	has_many :articles #, optional: true

	belongs_to :site

	def set_slug
		self.slug = title.parameterize if !self.title.nil? && !self.title.empty? && (self.slug.nil? || self.slug.empty?)
	end

	def uniqueless_category_slug
		 if Category.exists?(site: self.site, slug: self.slug)
		 	errors.add(:message, ': Une catégorie avec ce slug existe déja')
		 	throw :abort
	 	end
	end

end
