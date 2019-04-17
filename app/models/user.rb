class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :groups, dependent: :destroy
  has_many :orders, dependent: :destroy
  serialize :friends
  acts_as_target
  # serialize :groups
  # serialize :orders
  has_many :orderusers
  has_many :groupmembers
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  def self.search(search)
		where("users.email LIKE ?", "%#{search}%")
	end
end
