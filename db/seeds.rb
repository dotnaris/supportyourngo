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
User.destroy_all

users = []
projects_name = ["Help our planet", "Plant a tree", "Help a child", "Make water accessible", "Water is a human right", "Save biodiversity", "Let's collect plastics from the ocean",
                 "Education for everyone", "We can do it", "Zero hunger", "Help pandas from extinction", "Clean up street garbages", "Hygiene for everyone", "Help us with creating paper cups",
                 "Stop climate change", "Burger distribution challenge", "1.5 degrees", "Gender equality and equity", "No more fast fashion", "Spread some love", "Stop child abuse",
                 "Stop human trafficking", "NO MORE SHEIN", "6 cents is not for one t-shirt", "help us with seed file"]

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "*************"
  )
  user.save!
  users << user
end

100.times do
  project = Project.new(
    name: projects_name.sample,
    location: Faker::Address.country,
    user: users.sample
  )
  project.save!
  puts "Project_location: #{project.location}, Project_name: #{project.name}, and Project_user: #{project.user}"
end
puts "Projects created"
