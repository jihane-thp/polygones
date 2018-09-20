class ExtensionPlugin < ApplicationRecord

  has_many :plugin
  has_many :sites, through: :plugin

end
