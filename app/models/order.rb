class Order < ApplicationRecord
    belongs_to :user
    has_many :items

    # serialize :joined_
end
