class CreateGroupmembers < ActiveRecord::Migration[5.2]
  def change
    create_table :groupmembers do |t|
      t.integer  :group_id
      t.integer  :user_id
      t.string   :user_email
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
