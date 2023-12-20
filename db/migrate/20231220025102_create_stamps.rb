class CreateStamps < ActiveRecord::Migration[7.0]
  def change
    create_table :stamps do |t|
      t.string :name
      t.string :image_url
      t.integer :value

      t.timestamps
    end
  end
end
