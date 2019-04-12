class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  #has_many :groups, dependent: :destroy
  has_many :orders, dependent: :destroy
  serialize :friends
  #serialize :groups
  #serialize :orders
=======
  # has_many :groups, dependent: :destroy
  has_many :orders, dependent: :destroy
  serialize :friends
  # serialize :groups
  # serialize :orders
>>>>>>> 56224574eab6c9538211cc3c45d954c530e86282
end
