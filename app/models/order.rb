class Order < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :destroy
    has_many :orderusers, dependent: :destroy
    ORDER_TYPES = ["Volunteer", "Participant"]
    has_one_attached :menu , :dependent => :delete_all  

    # serialize :joined_

    # acts_as_notifiable configures your model as ActivityNotification::Notifiable
    # with parameters as value or custom methods defined in your model as lambda or symbol.
    # The first argument is the plural symbol name of your target model.
    acts_as_notifiable :users,
    targets: ->(order, key ) {
        if key == "invited you to order from"
            [User.find(order.invited_users)]
        elsif key == "finished an order from"  
            p "order finished send notification to invited users"
            @ordusers=Orderuser.where(order_id: order.id , status: 1)
            @invited_users ||= []
            @ordusers.each do |u|
                @invited_users << User.find(u.user_id)   
               end
            p @invited_users
            @invited_users
        elsif key == "cancelled an order from"  
            [User.find(order.invited_users)]
        end
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
