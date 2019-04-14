class ChangeCreateGroups < ActiveRecord::Migration[5.2]
    def change
      change_table :groups do |t|
        t.string :friends        
      end
    end
  end
  