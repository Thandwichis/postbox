class AddReadAtToLetters < ActiveRecord::Migration[7.0]
  def change
    add_column :letters, :read_at, :datetime
  end
end
