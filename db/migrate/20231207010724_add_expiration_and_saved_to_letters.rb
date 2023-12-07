class AddExpirationAndSavedToLetters < ActiveRecord::Migration[7.0]
  def change
    add_column :letters, :expires_at, :datetime
    add_column :letters, :saved, :boolean
  end
end
