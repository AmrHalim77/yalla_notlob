class Friendship < ApplicationRecord
    belongs_to :user
	belongs_to :friend, :class_name => "User"
    

    acts_as_notifiable :users,
    targets: ->(friend, key ) {
        if key == "add you as a friend"
            # [User.find(friend.friend_id)]
            User.all
        end
    },notifiable_path: :user_notifiable_path

    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    # targets: ->(order, key) {
    #     (User.all.to_a  - [User.find((order.user_id).to_s)]).uniq
    # },notifiable_path: :article_notifiable_path

    def user_notifiable_path
        user_index_path(id)
    end


    
	def name_with_initial
    "#{User.find(friend_id).name}"
    end
end
