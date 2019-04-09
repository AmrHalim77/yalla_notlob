class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.string :item_name
      t.integer :amount
      t.integer :price
      t.text :comment
      t.timestamps
      t.belongs_to :order, index: { unique: true }, foreign_key: true
      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
  end
end
