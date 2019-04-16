class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    ORDER_TYPES = ["Volunteer", "Participant"]
    has_one_attached :menu

    # serialize :joined_

    # acts_as_notifiable configures your model as ActivityNotification::Notifiable
    # with parameters as value or custom methods defined in your model as lambda or symbol.
    # The first argument is the plural symbol name of your target model.
    acts_as_notifiable :users,
    targets: ->(order, key) {
        User.all
    },notifiable_path: :order_notifiable_path

    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    # targets: ->(order, key) {
    #     (User.all.to_a  - [User.find((order.user_id).to_s)]).uniq
    # },notifiable_path: :article_notifiable_path

    def order_notifiable_path
        order_display_notification_path(id)
        # redirect_to "/order/index" 
        # order_index_path()
    end


end
