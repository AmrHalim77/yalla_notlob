class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    ORDER_TYPES = ["Volunteer", "Participant"]
    has_one_attached :menu

    # serialize :joined_
end
