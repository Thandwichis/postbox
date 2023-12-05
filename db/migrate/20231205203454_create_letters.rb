class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content
      t.datetime :delivery_time
      t.string :status

      t.timestamps
    end
  end
end
