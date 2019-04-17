class Orderuser < ApplicationRecord
    belongs_to :user
    belongs_to :order
    validates_uniqueness_of :user_id, :scope => :order_id
end
