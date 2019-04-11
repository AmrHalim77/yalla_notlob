class RemoveUniqeness < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :order_id
    remove_column :items, :user_id

    change_table :items do |t|
      t.belongs_to :user, index: { unique: false }, foreign_key: true
      t.belongs_to :order, index: { unique: false }, foreign_key: true
    end
  end

end

