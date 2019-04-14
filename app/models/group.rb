class Group < ApplicationRecord
  belongs_to :user
  serialize :friends
end
