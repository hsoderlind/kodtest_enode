# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Populate categories
[ "Nya utgåvor", "Vanliga filmer", "Gamla filmer" ].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Populate campaigns
Campaign.create(name: "Nya utgåvor", points: 20, category_id: Category.find_by(name: "Nya utgåvor").id)
Campaign.create(name: "Vanliga filmer", points: 10, category_id: Category.find_by(name: "Vanliga filmer").id)
Campaign.create(name: "Gamla filmer", points: 5, category_id: Category.find_by(name: "Gamla filmer").id)
