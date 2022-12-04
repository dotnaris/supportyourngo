# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Pledge.destroy_all
Project.destroy_all
Contribution.destroy_all
User.destroy_all


users = []

# rand_paragraph = 'The French government has recently passed a law that will help improve the lives of cats in the country. The new law requires that all cat owners spay or neuter their pets, and it also bans the declawing of cats. This is great news for animal welfare advocates, as it will help reduce the number of homeless cats in France. It will also help improve the overall health of the cat population, as spaying and neutering can help prevent certain health problems. If you love cats and want to help make a difference in their lives, there are a few things you can do. You can spread the word about this new law and encourage others to spay or neuter their own cats. You can also donate to organizations that are working to help improve the lives of cats in France. Every little bit helps!'

projects_name = ["Help our planet", "Plant a tree", "Help a child", "Make water accessible", "Water is a human right", "Save biodiversity", "Let's collect plastics from the ocean",
                 "Education for everyone", "We can do it", "Zero hunger", "Help pandas from extinction", "Clean up street garbages", "Hygiene for everyone", "Help us with creating paper cups",
                 "Stop climate change", "Burger distribution challenge", "1.5 degrees", "Gender equality and equity", "No more fast fashion", "Spread some love", "Stop child abuse",
                 "Stop human trafficking", "NO MORE SHEIN", "6 cents is not for one t-shirt", "help us with seed file", "Help animals! Cat food project"]

amounts = ["50", "100,00", "200,00", "300,00", "600,00", "1200,00", "2400,00", "5800,00", "11,600,00", "23,200,00", "46,400,00", "92,800,00", "185,600,00",
           "371,200,00", "742,400,00", "148,400,00", "384,00", "768,00", "1,536,00", "3,072,00", "6,144,00", "12,288,00", "24,576,00", "49,152,00", "98,304,00", "196,608,00", "393,216,00", "786,432,00", "1,572,864,00"]

################################################################################

50.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "*************"
  )
  user.save!
  users << user
end

50.times do
  project = Project.new(
    name: projects_name.sample,
    location: Faker::Address.country,
    user: users.sample,
    description: Faker::Quote.famous_last_words,
    paragraph_title: 'The French government has recently passed a law that will help improve the lives of cats in the country. The new law requires that all cat owners spay or neuter their pets, and it also bans the declawing of cats. This is great news for animal welfare advocates, as it will help reduce the number of homeless cats in France. It will also help improve the overall health of the cat population, as spaying and neutering can help prevent certain health problems. If you love cats and want to help make a difference in their lives, there are a few things you can do. You can spread the word about this new law and encourage others to spay or neuter their own cats. You can also donate to organizations that are working to help improve the lives of cats in France. Every little bit helps!'
  )
  project.save!
  puts "Project_location: #{project.location}, Project_name: #{project.name}, and User_of_the_project: #{project.user.name}"
end
puts "Projects created"

50.times do
  contribution = Contribution.new(
    user: users.sample,
    project: Project.all.sample,
    amount: amounts.sample
  )
  contribution.save!
  puts "user_who_contributed: #{contribution.user.name}, Project_name: #{contribution.project.name}, and amount: #{contribution.amount}"
end

50.times do
  pledge = Pledge.new(
    title: projects_name.sample,
    reward: "Help #{Faker::Creature::Cat.breed}",
    description: "20x cat food",
    project: Project.all.sample
  )
  pledge.save!
  puts "Pledge_title: #{pledge.title}, Pledge_reward: #{pledge.reward}, Pledge_description: #{pledge.description},
  and Pledge_title: #{pledge.project.name}"
end
