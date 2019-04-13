class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :groups, dependent: :destroy
  has_many :orders, dependent: :destroy
  serialize :friends
  # serialize :groups
  # serialize :orders
  def self.search(search)
		where("users.email LIKE ?", "%#{search}%")
	end
end
