# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


30.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Lorem.sentences(1).join(" "), price: Faker::Commerce.price, email: Faker::Internet.email, category_id: rand(1..10), key: Faker::Internet.password(8) )
end

10.times do
  Category.create(title: Faker::Commerce.department)
end
