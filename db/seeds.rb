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
Tweet.destroy_all
User.destroy_all
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
  admin.avatar.attach(io: File.open("db/img/cat.jpg"), filename: "cat.jpg")
  admin.save
  puts "Admin created"
else
  puts admin.errors.full_messages.join(", ")
end

puts "Finish Admin"

# Admin
puts "Seeding users"
10.times do |i|
  user = User.new(
    username: Faker::Internet.unique.username, 
    name: Faker::Name.unique.name, 
    role: "member", 
    email: Faker::Internet.unique.email,
    password: "password"
  )
  if user.valid?
    user.avatar.attach(io: File.open("db/img/avatar_default.jpg"), filename: "avatar_default.jpg")
    user.save
    puts "User created"
  else
    puts user.errors.full_messages.join(", ")
  end
end
puts "Finish users"

puts "Create Tweets parents"
10.times do |n|
  user_id = User.find(rand(User.first.id...User.last.id))
  tw = Tweet.new(
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user: user_id,
    replied_to_id: nil
  )
  if tw.valid?
    tw.save
    puts "Tweet created parents"
  else
    puts tw.errors.full_messages.join(", ")
  end
end

puts "Create Tweets children"
10.times do |n|
  user_id = User.find(rand(User.first.id...User.last.id))
  tw = Tweet.new(
    body: Faker::Lorem.paragraph(sentence_count: 5),
    user: user_id,
    replied_to_id: Tweet.find(rand(Tweet.first.id...Tweet.last.id))
  )
  if tw.valid?
    tw.save
    puts "Tweet created"
  else
    puts tw.errors.full_messages.join(", ")
  end
end
puts "Finish Tweets"