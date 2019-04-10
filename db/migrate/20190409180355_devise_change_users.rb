# frozen_string_literal: true
class DeviseChangeUsers < ActiveRecord::Migration[5.2]
    def change
      change_table :users do |t|
        t.string :name
        t.string :friends
        t.string :groups
        t.string :orders
      end
    end
end
  