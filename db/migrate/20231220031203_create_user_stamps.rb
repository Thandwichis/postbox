class CreateUserStamps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stamp, null: false, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
