# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Stamp.create(name: '1 Cent Stamp', image_url: 'postage_stamp_one_penny.png', value: 1)
Stamp.create(name: '2 Cent Stamp', image_url: 'postage_stamp_two_penny.png', value: 2)
Stamp.create(name: '5 Cent Stamp', image_url: 'postage_stamp_five_penny.png', value: 5)
