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
Contribution.destroy_all
Pledge.destroy_all

users = []

projects_name = ["Help our planet", "Plant a tree", "Help a child", "Make water accessible", "Water is a human right", "Save biodiversity", "Let's collect plastics from the ocean",
                 "Education for everyone", "We can do it", "Zero hunger", "Help pandas from extinction", "Clean up street garbages", "Hygiene for everyone", "Help us with creating paper cups",
                 "Stop climate change", "Burger distribution challenge", "1.5 degrees", "Gender equality and equity", "No more fast fashion", "Spread some love", "Stop child abuse",
                 "Stop human trafficking", "NO MORE SHEIN", "6 cents is not for one t-shirt", "help us with seed file", "Help animals! Cat food project"]

amounts = ["50", "100,00", "200,00", "300,00", "600,00", "1200,00", "2400,00", "5800,00", "11,600,00", "23,200,00", "46,400,00", "92,800,00", "185,600,00",
           "371,200,00", "742,400,00", "148,400,00", "384,00", "768,00", "1,536,00", "3,072,00", "6,144,00", "12,288,00", "24,576,00", "49,152,00", "98,304,00", "196,608,00", "393,216,00", "786,432,00", "1,572,864,00"]


rand_numbers = [1..40]

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

50.times do
  contribution = Contribution.new(
    user: users.sample,
    project: Project.all.sample,
    amount: amounts.sample
  )
  contribution.save!
  puts "user_who_contributed: #{contribution.user}, Project_name: #{contribution.project}, and amount: #{contribution.amount}"
end

50.times do
  pledge = Pledge.new(
    title: projects_name.sample,
    reward: "Help #{Faker::Creature::Cat.breed}",
    description: Faker::Creature::Cat.breed,
    project: Project.all.sample
  )
  pledge.save!
end
