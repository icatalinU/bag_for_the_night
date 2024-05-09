# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require "open-uri"
require 'faker'

  new_bag = Bag.new(
    name: Faker::Commerce.product_name,
    brand: Faker::Company.name,
    price: Faker::Commerce.price(range: 50..500.0, as_string: true),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    condition: Faker::Hipster.word,
    location: Faker::Address.city
 )
 file = URI.open(bag_links[i])
 new_bag.photos.attach(io: file, filename: "Katabag.png", content_type: "image/png")

  new_bag.user = User.first
 new_bag.save

puts "Seeding completed!"
