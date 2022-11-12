# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating data samples ..."

10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  phone_number = Faker::PhoneNumber.cell_phone_in_e164
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  new_restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)

  5.times do
    content = Faker::Hipster.words.join(" ")
    rating = (1..5).to_a.sample
    new_review = Review.create(restaurant_id: new_restaurant.id, content: content, rating: rating)
  end
end

puts "Finished creatigng 10 restaurant samples!"
