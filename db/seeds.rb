# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |num|
  User.create(
    name: "User#{num}",
    email: "user#{num}@email.com",
    password: "password#{1}",
    password_confirmation: "password#{1}"
  )
end