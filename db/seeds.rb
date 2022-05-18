# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying all existing restaurant'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
10.times do
  resto = Restaurant.new(
    name: Faker::Restaurant.name,
    category: Restaurant::CATEGORY.sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  )
  resto.save
  15.times do
    rate = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: resto[:id]
    )
    rate.save
  end
end

puts 'All done!'
