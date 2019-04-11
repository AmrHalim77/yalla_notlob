class DropUniqUser < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :orders, name:"index_orders_on_user_id"
    remove_foreign_key :orders, name:"index_orders_on_orders_id"

    
    
  end
end
