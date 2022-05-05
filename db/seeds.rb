# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 1 admin user with email admin@mail.com and password supersecret
# Create 4 member users
# Each member should create some tweets
# Each member should reply to some other tweets
# Each member should like some tweets

puts "Destroying data"

puts "Finish "

# Admin
# password = "password"
puts "Seed Admin"

admin = User.new(
  username: "admin", 
  name: "admin", 
  role: "admin", 
  email: "admin@mail.com",
  password: "password"
)
if admin.valid?
  admin.save
  
  puts "Admin created"
else
  puts admin.errors.full_messages.join(", ")
end

puts "Finish Admin"

# Admin
puts "Seeding users"
4.times do |i|
  user = User.create(
    username: Faker::Internet.username,
    name: Faker::Name.name,
    role: "member",
    email: Faker::Internet.email,
    password: "password"
  )
  if user.save
    puts "User created"
  else
    puts user.errors.full_messages.join(", ")
  end
end
puts "Finish users"

