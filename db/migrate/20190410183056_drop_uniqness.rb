class DropUniqness < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :orders, name:"index_users_on_email"

    change_table :orders do |t|
      t.belongs_to :orders, index: { unique: false }, foreign_key: true
    end
    
  end
end
