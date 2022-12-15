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

sample_texts = ["The Rainforest Foundation works to protect the rights of indigenous communities and the biodiversity of the Amazon rainforest. Through sustainable development projects and advocacy efforts, we strive to ensure a fair and just future for all.",
                "At the Wildlife Conservation Society, we tackle some of the most pressing issues facing wildlife and wild places. From reducing plastic pollution in oceans to protecting elephants from poaching, our projects aim to make a lasting impact.",
                "The Fair Trade Coffee Company works with small-scale farmers in developing countries to produce high-quality, ethically-sourced coffee. By providing fair wages and promoting sustainable farming practices, we support communities and protect the environment.",
                "The Clean Water Fund works to improve access to clean and safe drinking water in communities around the world. Through education, advocacy, and community-based projects, we strive to protect this essential resource for current and future generations.",
                "At the Climate Action Network, we bring together hundreds of organizations to take action on climate change. From lobbying for stronger policies to supporting local renewable energy projects, we work to create a safer and more sustainable future for all.",
                "The Ocean Conservancy is dedicated to protecting the world's oceans and the life they support. From cleaning up marine debris to conserving critical habitat, our projects aim to ensure a healthy future for our oceans and all who depend on them.",
                "The Fair Trade Association promotes fair trade principles and practices to create more equitable and sustainable global trade. Through education and certification programs, we support farmers and workers in developing countries and help consumers make more ethical purchasing choices.",
                "The Environmental Defense Fund works to find practical solutions to the most urgent environmental challenges. From reducing greenhouse gas emissions to protecting biodiversity, our projects aim to create a healthier and more sustainable future for all.",
                "The Nature Conservancy is a global conservation organization working to protect the lands and waters on which all life depends. From restoring forests and grasslands to protecting coral reefs and other critical habitats, our projects aim to safeguard the natural world for future generations.",
                "The Global Greengrants Fund provides small grants to grassroots organizations working on environmental and social justice issues. Their projects range from protecting forests and rivers to promoting clean energy and safe food systems.",
                "Women for Women International supports women in war-torn regions with financial aid, job training, and rights education. They also help women access health care and other services, empowering them to rebuild their lives and communities.",
                "Oxfam is a global organization that works to end the injustice of poverty. They provide emergency relief, development programs, and campaigning efforts to address issues like inequality, discrimination, and climate change.",
                "Doctors Without Borders delivers medical care to people affected by conflict, epidemics, natural disasters, and other crises. They provide emergency aid and long-term support, with a focus on reaching the most vulnerable and hard-to-reach populations.",
                "The Fair Trade Alliance Kerala works to promote fair trade practices and support small-scale farmers and artisans in India. They focus on issues like fair prices, good working conditions, and environmental sustainability in the production of goods like coffee and tea.",
                "The International Rescue Committee responds to the world's worst humanitarian crises, providing health care, education, and protection to refugees and displaced people. They also work to restore safety, dignity, and hope to communities torn apart by conflict and disaster.",
                "The Wildlife Conservation Society protects wildlife and wild places around the world. Through science, conservation, and education, they work to preserve species and ecosystems, and to help communities and governments adopt sustainable practices.",
                "The Rainforest Action Network campaigns for the forests, their inhabitants, and the natural systems that sustain life by transforming the global marketplace through education, grassroots organizing, and non-violent direct action.",
                "Save the Children provides children in need with healthcare, education, protection, and emergency relief. They work to give children a healthy start in life, the opportunity to learn, and protection from harm.",
                "Greenpeace is a global, independent campaigning organization that uses non-violent, creative confrontation to expose global environmental problems and to force solutions for a green and peaceful future.",
                "The World Wildlife Fund works to protect the diversity of life on Earth and the future of nature. They focus on the conservation of species and their habitats, and on addressing global threats like climate change, deforestation, and pollution.",
                "The World Food Programme is the world's largest humanitarian organization, working to end hunger and malnutrition. They provide food assistance to people in need, and work to improve the food security and nutrition of communities and households around the world.",
                "The International Committee of the Red Cross provides humanitarian aid to people affected by armed conflict, natural disasters, and other emergencies. They work to protect and assist people affected by crises, and to promote respect for international humanitarian law.",
                "Sustainable Harvest International works to empower rural families in Central America and the Amazon to break the cycle of poverty and protect the environment. They provide training, support, and access to markets for small-scale farmers and indigenous communities.",
                "Amnesty International is a global movement of more than seven million people who campaign for human rights. They work to defend people who are denied justice, freedom, and dignity, and to end abuses of human rights.",
                "The Pesticide Action Network is a global network of organizations working to replace the use of hazardous pesticides with ecologically sound and socially just alternatives. They promote sustainable agriculture, healthy food systems, and environmental justice.",
                "The International Union for Conservation of Nature is a global organization that works to conserve nature and promote sustainable use of natural resources. They provide scientific data and advice, and support conservation efforts around the world.",
                "The Jane Goodall Institute works to protect chimpanzees and their habitats, and to support the communities that coexist with them. They also promote conservation, sustainable development, and research on chimpanzee behavior and ecology.",
                "The Water Project is a non-profit organization that works to provide clean, safe drinking water to communities in sub-Saharan Africa. They partner with local organizations to build wells, sanitation systems, and other water infrastructure, and to promote hygiene education.",
                "The Global Fund for Women provides grants to organizations working to advance the rights of women and girls around the world. They support groups that are addressing issues like violence, poverty, and discrimination, and that are working to create positive change for women and girls.",
                "UNICEF works to promote the rights and well-being of every child, in everything they do. They provide assistance to children and families in need, and work to protect children from violence, exploitation, and disease.",
                "The Climate Reality Project is a non-profit organization founded by Al Gore that is dedicated to educating the public about the urgent need to address climate change. They work to empower individuals and communities to take action on climate, and to support the transition to a clean energy future.",
                "The David Suzuki Foundation works to protect the health of the planet and its people. They focus on issues like climate change, oceans, and sustainability, and work to find solutions that are fair and effective.",
                "The Rainforest Foundation UK works to protect the rights of the indigenous and forest communities who live in and around the world's rainforests. They support local organizations and campaigns, and work to promote fair and sustainable use of the rainforests' resources.",
                "The Borneo Orangutan Survival Foundation works to conserve the habitat of the critically endangered Bornean orangutan and to rehabilitate and release orphaned and displaced orangutans back into the wild. They also work to protect forests, educate local communities, and support conservation efforts in Borneo.",
                "The Migrant Rights International is a non-profit organization that works to promote and protect the rights of migrants and refugees around the world. They provide support and assistance to migrants, and work to raise awareness about the challenges and rights of migrants."]

projects_name = ["Save the Amazon rainforest", "Save biodiversity", "Help coffee farmers", "Water is a human right", "Stop climate change", "Collect plastics from the ocean", "Fair trade goods",
                "1.5 degrees", "Protect our lands and waters", "Microgrants to protect the environment", "Gender equality", "Fight poverty", "Healthcare for everyone",
                "Fair trade regulations for India", "Health care and education for refugees", "Protecting wildlife", "Stop killind our rainforests", "Help a child", "No more SHEIN", "Protect our biodiversity",
                "Zero hunger", "Humanitarian aid now", "Sustainable harvesting practices", "Stop child abuse", "Stop pesticide usage!", "Conserve our planet", "Protect chimpanzees", "Clean water for everyone",
                "Equal rights for women and girls", "Education for every child", "Climate change education", "No more fast fashion", "Preserve rights of the indigenous", "Conserve the habitat of orangutans", "Protect the rights of migrants"]

company_name = ["The Rainforest Foundation", "Wildlife Conservation Society", "The Fair Trade Coffee Company", "The Clean Water Fund", "Climate Action Network", "The Ocean Conservancy", "The Fair Trade Association", "The Environmental Defense Fund", "The Nature Conservancy", "The Global Greengrants Fund",
                "Women for Women International", "Oxfam", "Doctors Without Borders", "The Fair Trade Alliance Kerala", "The International Rescue Committee", "The Wildlife Conservation Society", "The Rainforest Action Network", "Save the Children", "Greenpeace",  "The World Wildlife Fund", "The World Food Programme",
                "The International Committee", "Sustainable Harvest International", "Amnesty International", "The Pesticide Action Network", "The International Union", "The Jane Goodall Institute", "The Water Project", "The Global Fund for Women", "UNICEF", "The Climate Reality Project", "The David Suzuki Foundation",
                "The Rainforest Foundation UK", "The Borneo Orangutan Survival Foundation", "The Migrant Rights International"]

sample_locations = ["Brazil", "Kenya", "Colombia", "Lybia", "Belgium", "South Africa", "Vietnam", "Honduras", "Indonesia", "Venezuela", "Iran", "Somalia", "Congo", "India", "Eritrea", "Tanzania", "Indonesia", "Mali", "Australia", "Argentina", "Rwanda", "Afghanistan", "Brazil", "Iran", "United States of America", "Germany", "Senegal", "Ethiopia", "Turkey", "Haiti", "Mexico", "Japan", "United Kingdom", "Borneo", "France"]

amounts = ["50", "100,00", "200,00", "300,00", "600,00", "1200,00", "2400,00", "5800,00", "11,600,00", "23,200,00", "46,400,00", "92,800,00", "185,600,00",
           "371,200,00", "742,400,00", "148,400,00", "384,00", "768,00", "1,536,00", "3,072,00", "6,144,00", "12,288,00", "24,576,00", "49,152,00", "98,304,00", "196,608,00", "393,216,00", "786,432,00", "1,572,864,00"]

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

35.times do
  project = Project.new(
    name: projects_name.sample,
    location: sample_locations.sample,
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
puts "********** 50 Projects created ✔︎      **********"
puts "**********      -  -                  **********"
puts "********** And 50 Pledges created ✔︎   **********"
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
