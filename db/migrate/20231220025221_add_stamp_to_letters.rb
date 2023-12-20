class AddStampToLetters < ActiveRecord::Migration[7.0]
  def change
    add_reference :letters, :stamp, null: true, foreign_key: true  end
end
