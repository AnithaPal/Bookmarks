# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#Create Users

10.times do 

  user = User.new(
    name:  Faker::Name.name,
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(8))
  user.skip_confirmation!
  user.save!
end

user = User.new(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'helloworld')
user.skip_confirmation!
user.save!

user = User.new(
  name: 'User',
  email: 'User@example.com',
  password: 'helloworld')
user.skip_confirmation!
user.save!

users = User.all 

20.times do
  topic = Topic.new(
    user: users.sample,
    title: "##{Faker::Lorem.word}"
    )
  topic.save!

end

topics = Topic.all

30.times do
  bookmark = Bookmark.new(
    topic: topics.sample,
    title: Faker::Lorem.word,
    url: Faker::Internet.url('example.com'),
    user: users.sample)
  bookmark.save!
end

puts "Seeding Finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."

