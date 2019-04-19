class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_status
      t.string :order_type
      t.string :restaurant
      t.string :menu_image
      t.string :joined_users
      t.string :invited_users
      t.string :order_items

      t.timestamps

      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
  end
end
