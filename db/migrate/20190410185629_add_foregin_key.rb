class AddForeginKey < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.belongs_to :user, index: { unique: false }, foreign_key: true
    end
  end
end
