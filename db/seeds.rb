# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Stamp.find_or_create_by(name: '1 Cent Stamp') do |stamp|
    stamp.image_url = 'postage_stamp_one_penny.png'
    stamp.value = 1
  end
  
  Stamp.find_or_create_by(name: '2 Cent Stamp') do |stamp|
    stamp.image_url = 'postage_stamp_two_penny.png'
    stamp.value = 2
  end
  
  Stamp.find_or_create_by(name: '5 Cent Stamp') do |stamp|
    stamp.image_url = 'postage_stamp_five_penny.png'
    stamp.value = 5
  end
  
  Stamp.find_or_create_by(name: '15 Cent Stamp') do |stamp|
    stamp.image_url = 'postage_stamp_fifteen_penny.png'
    stamp.value = 15
  end
  