class CreateOrderusers < ActiveRecord::Migration[5.2]
  def change
    create_table :orderusers do |t|
      t.integer  :user_id
      t.integer  :order_id
      t.integer   :status
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
