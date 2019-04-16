class DropMenuImage < ActiveRecord::Migration[5.2]
    def change
      remove_column :orders, :menu_image
    end
  end