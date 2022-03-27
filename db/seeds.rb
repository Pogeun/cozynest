# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pet_categories = ["dog", "cat", "bird", "rabbit", "guinea pig", "hamster", "turtle", "snake", "ferret", "other"]

if PetCategory.count == 0
    pet_categories.each do |category|
        PetCategory.create(name: category)

        puts "created pet category: #{category}"
    end
end