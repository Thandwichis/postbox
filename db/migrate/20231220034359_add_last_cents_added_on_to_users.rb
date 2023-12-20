
class AddLastCentsAddedOnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_cents_added_on, :date
  end
end