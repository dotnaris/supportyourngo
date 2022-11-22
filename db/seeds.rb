# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Project.destroy_all
# User.destroy_all

# users = []

# 5.times do
#   user = User.new(
#     # first_name: Faker::Name.first_name,
#     # last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "*************"
#   )
#   user.save!
#   users << user
# end


20.times do
  project = Project.new(
    location: Faker::Address.country,
  )
  project.save!
  puts "Project_location: #{project.location}"
end
puts "Cameras created"
