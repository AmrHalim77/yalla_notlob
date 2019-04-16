class CreateGroupmembers < ActiveRecord::Migration[5.2]
  def change
    create_table :groupmembers do |t|
      t.integer :member_id
      t.integer :group_id      
      t.timestamps
      ffffffffffffffffffffffffffffffffffffffffffffff
    end
  end
end
