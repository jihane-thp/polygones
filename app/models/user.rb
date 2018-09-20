class User < ApplicationRecord
  enum role: {superadmin: "superadmin", admin: "admin", contributor: "contributor",user: "user"}
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= "admin"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :cart, optional: true
    belongs_to :site, optional: true

    has_many :articles
    has_many :comments
    has_many :orders

    # validates :first_name, :last_name, :email, :avatar,
    #           :nickname, :password, :password_confirmation,
    #           presence: true
end
