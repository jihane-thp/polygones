class Comment < ApplicationRecord

	validates :content, presence: true

	belongs_to :user, optional: true
	belongs_to :article
end
