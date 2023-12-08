class AddCentsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cents, :integer, default: 0
  end
end
