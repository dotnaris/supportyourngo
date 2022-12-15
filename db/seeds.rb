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

sample_texts = ["The Forest Foundation is fighting the plastic pollution in the oceans! We are helping to clean up the coasts and work together with local fishermen to get rid of waste that has accumulated in the sea. Join us today and make a difference!",
                "Wildlife Society helps communities in need access essential services like health care and education. Our dedicated volunteers are working together with local organizations to bring resources and knowledge to those who need it most. Join us in making a difference!",
                "Fair Trade Coffee is working to combat global warming through renewable energy sources. We are committed to finding more sustainable solutions that will help protect the environment and reduce our carbon footprint. Join us and make a difference today!",
                "Clean Water Society is dedicated to protecting wild animals and preserving their habitats. We work with local communities to ensure that natural reserves are well-protected and that endangered species have a chance to thrive. Join us in our mission today!",
                "Climate Action Fund is committed to helping families living in poverty access basic necessities such as food, water, clothing, and shelter. We work with local organizations to provide resources and knowledge to those who need it most. Join us in making a difference!",
                "The Ocean Fund is dedicated to empowering women and girls around the world. We are committed to creating equal opportunities for all genders and fighting against gender-based discrimination. Join us today and make a difference!",
                "The Fair Trade Society is working to create sustainable agriculture systems that benefit both people and the environment. We are committed to promoting organic, local, and fair-trade farming practices that will ensure food security while preserving natural resources. Join us in our mission today!",
                "The Environmental Fund is fighting against human trafficking and modern slavery. We are committed to helping victims escape from their captors and connecting them with resources and support. Join us in the fight against injustice today!",
                "The Nature Conservancy is taking action against climate change by promoting clean energy sources such as wind and solar power. We work with local organizations to ensure that renewable energy investments are made responsibly and that communities are properly compensated. Join us in making a difference!",
                "The Greengrants Association is committed to protecting the rights of indigenous people around the world. We work with local organizations to ensure that their voices are heard and that their traditions are respected and preserved. Join us today and make a difference!",
                "Women for Women is working to promote clean water access for all. We are committed to finding sustainable solutions to ensure that everyone has access to safe, clean drinking water. Join us in our mission today!",
                "NGO.org is dedicated to reducing child labor and promoting the rights of young people around the world. We work with local organizations to provide education and resources to those who need it most. Join us in making a difference!",
                "Doctors International is working to protect the environment and combat deforestation. We are committed to finding sustainable solutions that will help preserve the planet's natural resources for future generations. Join us in our mission today!",
                "The Fair Trade Alliance is dedicated to providing aid and relief to refugees and displaced people around the world. We work with local organizations to ensure that those in need receive the help they need. Join us today and make a difference!",
                "The Rescue Association is committed to promoting gender equality and empowering women in developing countries. We are dedicated to providing education, resources, and access to opportunities for all genders. Join us in our mission today!",
                "Wildlife Conservation is taking action to reduce plastic pollution and protect the world’s oceans. We are committed to finding sustainable solutions that will help keep our oceans clean and preserve marine life. Join us in making a difference!",
                "Rainforest Action is dedicated to helping children living in poverty get access to education and resources they need to succeed. We work with local organizations to ensure that young people have opportunities for growth and development. Join us in our mission today!",
                "Save Children is working to combat hunger, malnutrition, and food insecurity around the world through sustainable farming initiatives. We are committed to providing resources, support, and education to those who need it most. Join us today and make a difference!",
                "Green Society is fighting against human rights violations and advocating for the rights of all individuals around the world. We are dedicated to providing legal aid, resources, and support to those who need it most. Join us in our mission today!",
                "World Wildlife Conservancy is taking action to protect endangered wildlife species and preserve their natural habitats. We work with local organizations to ensure that these threatened animals have a safe place to live and thrive. Join us in making a difference!",
                "Food for the World is devoted to preserving cultural heritage sites around the world so that future generations can appreciate them for years to come. We work with local organizations to ensure that these historical places of importance are respected and protected from harm. Join us in our mission today!",
                "International Sustainability Society is working to promote access to healthcare for all individuals around the world. We are dedicated to providing resources, support, and education so that everyone has access to quality medical care and treatment. Join us today and make a difference!",
                "Sustainable Harvest Association is committed to fighting climate change and protecting the planet from further destruction. We work with local organizations to find sustainable solutions that will help reduce emissions and protect the environment for future generations. Join us in our mission today!",
                "Safety for Children is devoted to ending animal cruelty and promoting the rights of all animals around the world. We are dedicated to providing resources, support, and education so that these sentient beings are treated with respect and care. Join us in making a difference!",
                "The Pesticide Action Society is working to reduce pollution and protect the environment from further harm. We are committed to finding sustainable solutions that will help keep our planet healthy and clean for future generations. Join us today and make a difference!",
                "The Rainforest Union is devoted to promoting peace, security, and stability around the world through nonviolent interventions and initiatives. We work with local organizations to ensure that all individuals have access to resources they need for peaceful resolution of conflicts. Join us in our mission today!",
                "The Green Institute is fighting against poverty, inequality, and injustice around the world by providing resources, support, and education so that everyone has access to economic opportunities and a better quality of life. Join us in making a difference!",
                "The Clean Water Fund is taking action to protect human rights and promote the rights of all individuals around the world. We are dedicated to providing legal aid, resources, and support so that everyone has access to justice and equality under the law. Join us in our mission today!",
                "The Society for Women is devoted to preserving cultural diversity and promoting tolerance around the world through educational initiatives and programs. We work with local organizations to ensure that people of all backgrounds have access to resources they need for mutual understanding and respect. Join us today and make a difference!",
                "NGO for safety is working to end gender discrimination, violence against women, and inequality, and to ensure that all individuals have access to equal rights, opportunities, and resources. We are dedicated to providing education and support so that everyone can live a life of dignity. Join us in our mission today!",
                "The Climate Reality Association is committed to improving access to clean water for those who need it most by supporting local organizations with their initiatives, providing resources, and educating communities about the importance of a safe and reliable source of water. Join us in making a difference!",
                "The Hiroto, Alex & Malte Foundation is devoted to protecting vulnerable populations from exploitation and abuse by advocating for their rights, providing legal aid, and offering support services so that these individuals have access to justice and safety. Join us in our mission today!",
                "The Rainforest Society Japan is taking action to fight climate change and protect the environment by working with local organizations to find sustainable solutions that will reduce emissions and preserve natural habitats for future generations. Join us today and make a difference!",
                "The Orangutan Survival Fund is dedicated to preserving indigenous traditions, cultures, languages, and sacred sites around the world so that these historical places of importance are respected and protected from harm. Join us in our mission today!",
                "Migrant Rights is devoted to promoting education for all individuals around the world by providing resources, support, and educational opportunities so that everyone has access to quality learning opportunities. Join us in making a difference!",
                "The Supportive NGO is committed to ending hunger and malnutrition around the world through nutrition initiatives, agricultural programs, and community education so that everyone has access to healthy, nutritious food. Join us in our mission today!"]

projects_name = ["Save the Amazon rainforest", "Save biodiversity", "Help coffee farmers", "Water is a human right", "Stop climate change", "Collect plastics from the ocean", "Fair trade goods",
                "1.5 degrees", "Protect our lands and waters", "Microgrants for the environment", "Gender equality", "Fight poverty", "Healthcare for everyone",
                "Fair trade regulations for India", "Health care for refugees", "Protecting wildlife", "Help our seed file", "Stop killind our rainforests", "Help a child", "No more SHEIN", "Protect our biodiversity",
                "Zero hunger", "Humanitarian aid now", "Sustainable harvesting practices", "Stop child abuse", "Stop pesticide usage!", "Conserve our planet", "Protect chimpanzees", "Clean water for everyone",
                "Equal rights for women and girls", "Education for every child", "Climate change education", "No more fast fashion", "Preserve rights of the indigenous", "Conserve the habitat of orangutans", "Protect the rights of migrants"]

company_name = ["The Forest Foundation", "Wildlife Society", "Fair Trade Coffee", "Clean Water Society", "Climate Action Fund", "The Ocean Fund", "The Fair Trade Society", "The Environmental Fund", "The Nature Conservancy", "The Greengrants Association",
                "Women for Women", "NGO.org", "Doctors International", "The Fair Trade Alliance", "The Rescue Association", "Wildlife Conservation", "The Hiroto, Alex & Malte Foundation", "Rainforest Action", "Save Children", "Green Society",  "World Wildlife Conservancy", "Food for the World",
                "International Sustainability Society", "Sustainable Harvest Association", "Safety for Children", "The Pesticide Action Society", "The Rainforest Union", "The Green Institute", "The Clean Water Fund", "The Society for Women", "NGO for safety", "The Climate Reality Association",
                "The Rainforest Society Japan", "The Orangutan Survival Fund", "Migrant Rights", "The Supportive NGO"]

sample_locations = ["Brazil", "Kenya", "Colombia", "Lybia", "Belgium", "South Africa", "Vietnam", "Honduras", "Indonesia", "Venezuela", "Iran", "Somalia", "Congo", "India", "Eritrea", "Tanzania", "LeWagon Remote", "Indonesia", "Mali", "Australia", "Argentina", "Rwanda", "Afghanistan", "Brazil", "Iran", "United States of America", "Germany", "Senegal", "Ethiopia", "Turkey", "Haiti", "Mexico", "Japan", "United Kingdom", "Borneo", "France"]

amounts = ["50,00", "100,00", "200,00", "300,00", "600,00", "1200,00", "2400,00", "5800,00", "11600,00", "23200,00", "46400,00", "92800,00", "18560,00",
           "37200,00", "74400,00", "14800,00", "384,00", "768,00", "1536,00", "3072,00", "6144,00", "12288,00", "24576,00", "49152,00", "98304,00", "19660,00", "33216,00", "78432,00", "15864,00"]

sample_prices = [10, 20, 30, 50, 100, 200, 400, 800, 1600, 3200, 6400, 12800, 25600]

is_ngo = [ 0, 1 ]

counter1 = 0
counter2 = 0
counter3 = 0
counter4 = 0

################################################################################

30.times do
  user = User.new(
    name: company_name.sample,
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
puts "********** 30 Users created ✔︎         **********"
puts "**********      -  -                  **********"
puts ""
sleep 3

n = 0

36.times do
  project = Project.new(
    name: projects_name[n],
    location: sample_locations[n],
    user: users.sample,
    description: sample_texts[n],
    paragraph_title: sample_titles.sample
  )
  n += 1
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
    project_id: project.id
  )
  pledge.save!
  counter4 += 1
  puts "No. #{counter4}"
  puts "● Pledge_title: #{pledge.title}"
  puts "● Pledge_reward: #{pledge.reward}"
  puts "● Pledge_description: #{pledge.description}"
  puts "● Pledge_price: #{pledge.price}"
  puts "● Project_ID_of_this_pledge: #{pledge.project.id}"
  sleep 0.001
end
puts ""
puts "========================="

puts ""
puts "********** Woo Foo!!                  **********"
puts "********** 35 Projects created ✔︎      **********"
puts "**********      -  -                  **********"
puts "********** And 35 Pledges created ✔︎   **********"
puts "**********      -  -                  **********"
puts ""
sleep 3

1000.times do
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
puts "********** 1000 Contributions created ✔︎ **********"
puts "************************************************"
puts ""
