class AddStampTypeToLetters < ActiveRecord::Migration[7.0]
  def change
    add_column :letters, :stamp_type, :integer, default: 1
  end
end
