# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

50.times do |product|
  product = Product.create!(name: Faker::Food.ingredient, cost: Faker::Commerce.price, country_of_origin: Faker::WorldCup.team)

  5.times do |review|
    Review.create!(author: Faker::TvShows::DrWho.actor, content_body: Faker::Lorem.sentence(word_count: 15, supplemental: false, random_words_to_add: 0).chop , rating: Faker::Number.within(range: 1..5),  product_id: product.id)
  end
end

p "created #{Product.count} products and #{Review.count} reviews"