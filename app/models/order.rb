class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    ORDER_TYPES = ["Volunteer", "Participant"]

    # serialize :joined_
end
