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

sample_titles = ["Support your NGO with a donation",
                "Donate to an NGO today",
                "NGOs that need financial help",
                "How to donate money to an NGO",
                "How to support an NGO in your community",
                "How to support an organization through volunteering",
                "How to support an organisation by donating time",
                "How to support an NPO through donations",
                "How to support an Non Profit Organization",
                "How to support an non profit organization"]

sample_texts = ["Coffee is a popular beverage loved by people of all ages. Many people love drinking coffee and supporting farmers. Coffee is purchased through different channels including grocery stores, cafes, and social networks. On the other hand, farmers earn money by selling their coffee to local buyers. Although coffee is a delicious commodity, it's also an expensive one due to high labor costs. That's where crowdfunding comes in.
  Coffee is a major source of revenue for many farmers. Farmers spend a lot of time and money growing coffee beans. They need to protect their crops from pests and disease. They also need to provide their animals with food during the harvest season. However, buyers are willing to pay high prices for quality coffee beans. They're willing to cover the cost of high salaries and healthy farms. That allows farmers to make money from their hard work, all they need is a platform to sell on.",
                "Support Your NGO is an acronym for non-profit organization fundraising utilizing the Internet. Support Your NGO's campaign is a method whereby non-profit organizations seek funding from a wide network of donors. Essentially, it's a way to run an organized donation drive without the expense of traveling to different communities. Donations are generally made online, and platforms allow individuals to donate money directly to the cause. In this essay, we will discuss the concept of Support Your NGO, outline the factors to consider when choosing a Support Your NGO platform, and provide advice on how to effectively promote your fundraising campaign.",
                "Support Your NGO differs from conventional fundraising in several ways. Firstly, Support Your NGO sites are primarily focused on raising money for nonprofit organizations rather than business ventures. This means that the platform itself is chiefly concerned with helping non-profit organizations achieve their goals rather than making profit itself. Because of this, platforms typically have charity and cause-related themes such as food banks, animal shelters, and disaster relief campaigns. Since ngo fundraising is open to any non-profit organization, there are numerous possibilities for what can be funded and by whom.",
                "Support Your NGO is an excellent method for non-profit organizations seeking funds for their projects without incurring costly conventional methods. While unconventional at first glance, innovative ngo sites offer great opportunities for both potential donors and nonprofit organizations alike. Considering the factors that determine which platform is best for you can make all the difference when successfully promoting a ngo fundraising campaign!"]

projects_name = ["Help our planet", "Plant a tree", "Help a child", "Make water accessible", "Water is a human right", "Save biodiversity", "Let's collect plastics from the ocean",
                 "Education for everyone", "We can do it", "Zero hunger", "Help pandas from extinction", "Clean up street garbages", "Hygiene for everyone", "Help us with creating paper cups",
                 "Stop climate change", "Burger distribution challenge", "1.5 degrees", "Gender equality and equity", "No more fast fashion", "Spread some love", "Stop child abuse", "Help coffee farmers",
                 "Stop human trafficking", "NO MORE SHEIN", "6 cents is not for one t-shirt", "help us with seed file", "Help animals! Cat food project", "Help animals project 2.0", "Fight for environment"]

amounts = ["50", "100,00", "200,00", "300,00", "600,00", "1200,00", "2400,00", "5800,00", "11,600,00", "23,200,00", "46,400,00", "92,800,00", "185,600,00",
           "371,200,00", "742,400,00", "148,400,00", "384,00", "768,00", "1,536,00", "3,072,00", "6,144,00", "12,288,00", "24,576,00", "49,152,00", "98,304,00", "196,608,00", "393,216,00", "786,432,00", "1,572,864,00"]

sample_prices = [10, 20, 30, 50, 100, 200, 400, 800, 1600, 3200, 6400, 12800, 25600]

           is_ngo = [ 0, 1 ]

counter1 = 0
counter2 = 0
counter3 = 0
counter4 = 0

################################################################################

50.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    location: Faker::Address.country,
    password: "******",
    is_ngo: is_ngo.sample
  )
  user.save!
  users << user
  counter1 += 1
  puts "-------------------------"
  puts "No. #{counter1}"
  puts "● User_name: #{user.name}"
  puts "● User_email: #{user.email}"
  puts "● User_location: #{user.location}"
  puts "● User_passwors: #{user.password}"
  puts "● is_ngo: #{user.is_ngo}"
end

puts ""
puts "********** Woo Foo!!                  **********"
puts "********** 50 Users created ✔︎         **********"
puts "**********      -  -                  **********"
puts ""
sleep 3

50.times do
  project = Project.new(
    name: projects_name.sample,
    location: Faker::Address.country,
    user: users.sample,
    description: sample_texts.sample,
    paragraph_title: sample_titles.sample
  )
  project.save!
  counter2 += 1
  puts ""
  puts "========================="
  puts ""
  puts "No. #{counter2}"
  puts "● Project_location: #{project.location}"
  puts "● Project_name: #{project.name}"
  puts "● User_of_this_project: #{project.user.name}"
  puts "● Project_paragraph_title: #{project.paragraph_title}"
  puts "● Project_description: #{project.description}"

  puts ""
  puts "- - - - - -"
  puts ""

  pledge = Pledge.new(
    title: project.name,
    reward: project.paragraph_title,
    description: "Choose your pledge. (e.g 10 x cat food..)",
    price: sample_prices.sample,
    project: project
  )
  pledge.save!
  counter4 += 1
  puts "No. #{counter4}"
  puts "● Pledge_title: #{pledge.title}"
  puts "● Pledge_reward: #{pledge.reward}"
  puts "● Pledge_description: #{pledge.description}"
  puts "● Pledge_price: #{pledge.price}"
  puts "● Project_ID_of_this_pledge: #{pledge.project.id}"
  sleep 0.01
end
puts ""
puts "========================="

puts ""
puts "********** Woo Foo!!                  **********"
puts "********** 50 Projects created ✔︎      **********"
puts "**********      -  -                  **********"
puts "********** And 50 Pledges created ✔︎   **********"
puts "**********      -  -                  **********"
puts ""
sleep 5

5000.times do
  contribution = Contribution.new(
    user: users.sample,
    project: Project.all.sample,
    amount: amounts.sample
  )
  contribution.save!
  counter3 += 1
  puts "-------------------------"
  puts "No. #{counter3}"
  puts "● user_who_contributed: #{contribution.user.name}"
  puts "● Project_name_of_the_contribution: #{contribution.project.name}"
  puts "● Amount_of_the_contribution: #{contribution.amount}"
end

puts ""
puts "********** Woo Foo!!                  **********"
puts "********** 5000 Contributions created ✔︎ **********"
puts "************************************************"
puts ""
