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
  has_many :orderusers, dependent: :destroy
  has_many :groupmembers, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships, dependent: :destroy
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  def self.search(search)
		where("users.email LIKE ?", "%#{search}%")
	end
end
