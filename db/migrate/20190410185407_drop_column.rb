class DropColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :orders_id
    remove_column :orders, :user_id

  end
end
