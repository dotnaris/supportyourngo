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
                 "Stop human trafficking", "NO MORE SHEIN", "6 cents is not for one t-shirt", "help us with seed file", "Help animals! Cat food project"]

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "*************"
  )
  user.save!
  users << user
end

photos = ["https://images.unsplash.com/photo-1457530378978-8bac673b8062?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw5NTE3NzA5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1535231540604-72e8fbaf8cdb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw5NTE3NzA5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1554249906-53d1582266b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w5NTE3NzA5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXw5NTE3NzA5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1524069290683-0457abfe42c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1571688144157-25db897a81ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTN8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1523810192022-5a0fb9aa7ff8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1528634944319-189c272d7e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTZ8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1531482615713-2afd69097998?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTd8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1527720324130-db5f4d6abf8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjV8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1544776193-32d404ae608a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjZ8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1554721299-e0b8aa7666ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjl8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1529390079861-591de354faf5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzJ8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1518462592603-0b6bac106032?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzR8OTUxNzcwOXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1600792174569-59e1e0be0619?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTN8SkxVZ3ZXTC1fQkF8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1503585850419-d4c96ef49155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw1MDA4MTgxN3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1602484894924-75eddc89d32b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHw1MDA4MTgxN3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1522726832281-362409683a2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjh8NTAwODE4MTd8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1595695179355-f6fe194c504f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjl8NTAwODE4MTd8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60"]

100.times do
  project = Project.new(
    name: projects_name.sample,
    location: Faker::Address.country,
    user: users.sample
  )
  file = URI.open(photos.sample)
  project.photo.attach(io: file, filename: "image.png", content_type: "image/png")
  project.save!
  puts "Project_location: #{project.location}, Project_name: #{project.name}, and Project_user: #{project.user}"
end
puts "Projects created"
