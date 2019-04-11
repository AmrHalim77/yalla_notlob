class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    ORDER_TYPES = ["Volunteer", "Participant"]
    attachment :cover_photo

    # serialize :joined_
end
