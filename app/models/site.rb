class Site < ApplicationRecord

	before_validation :set_url
	validates :name,:url, presence: true
	validates :url, format: {with: /\A[a-z0-9\-]+\z/}

	has_many :templates
    has_many :products, through: :templates

	has_many :plugins
    has_many :extension_plugins, through: :plugins

	belongs_to :template

	belongs_to :user
	belongs_to :category, optional: true

	has_many :articles
	has_many :pulgins

	has_many :tabs


	def set_url
		self.url = url.parameterize
	end

	def uniqueless_url
		 if Site.exists?(url: self.url)
			errors.add(:message, ': Site existe deja')
			throw :abort
		end
	end

end
