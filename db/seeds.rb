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
require 'open-uri'

User.destroy_all

 #=> { username: 'catalin', email: 'catalin@gmail.com', password: 'password123' }
  User.create(

     email:"catalin@gmail.com",
    password: "password123"
  )

   bag_links =["https://images-na.ssl-images-amazon.com/images/I/813ptKmjJVL.jpg","https://m.media-amazon.com/images/I/71MQz9WZAxL._AC_SY695_.jpg","https://m.media-amazon.com/images/I/61mcR7xSM0L._AC_SX535_.jpg"]
# Delete existing bags
Bag.destroy_all

# Create 20 bags with regular brands
20.times do |i|

# Delete existing bags
Bag.destroy_all

bag_file = URI.open("https://collection.cloudinary.com/dwsotsv3c/cc34acfedc88f725cbdba817ac196e16")
20.times do

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

  )

  new_bag.photos.attach(io: bag_file, filename: "bag.png", content_type: "image/png")

  new_bag.user = User.first
 new_bag.save
end



# Custom picture URLs for designer bags
#designer_picture_urls = [
 # "https://example.com/designer_bag_1.jpg",
 # "https://example.com/designer_bag_2.jpg",
  # Add more custom picture URLs as needed
#]

# Create 20 bags with designer brands and custom picture URLs
#20.times do |i|
 # Bag.create!(
 #   name: Faker::Commerce.product_name,
  #  brand: Faker::Company.name,
  #  price: Faker::Commerce.price(range: 500..5000.0, as_string: true),
  #  description: Faker::Lorem.paragraph(sentence_count: 2),
  #  picture_url: designer_picture_urls[i % designer_picture_urls.length], # Cycle through custom picture URLs
   # condition: Faker::Hipster.word,
   # location: Faker::Address.city
 # )
#end

puts "Seeding completed!"
