class Group < ApplicationRecord
  belongs_to :user
  serialize :friends
  has_many :groupmembers

end
