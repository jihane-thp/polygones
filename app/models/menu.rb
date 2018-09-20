class Menu < ApplicationRecord

  has_one :site
  belongs_to :tab
  has_many :pages
  has_many :tabs

end
