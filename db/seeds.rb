# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'cleaing database'
Flat.destroy_all

puts 'creating 10 flats'

10.times do
  Flat.create!(
    name: Faker::JapaneseMedia::OnePiece.island,
    address: "#{rand(1000..9999)} #{Faker::JapaneseMedia::OnePiece.location} ave.",
    description: Faker::JapaneseMedia::OnePiece.quote,
    price_per_night: rand(125..500),
    number_of_guest: rand(2..8)
  )
end

puts 'completed 10 flats'

Flat.all.each_with_index do |flat, index|
  puts "#{index + 1} - #{flat.name}"
end
