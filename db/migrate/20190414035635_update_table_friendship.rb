class UpdateTableFriendship < ActiveRecord::Migration[5.2]
  def change
    change_table :friendships do |t|
      remove_column :friendships , :create
      remove_column :friendships , :destroy

  end
end
end
