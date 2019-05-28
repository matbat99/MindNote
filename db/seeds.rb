# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing Database..."
Session.destroy_all
Practice.destroy_all
Song.destroy_all
Artist.destroy_all
User.destroy_all

puts "Creating user..."
u = User.new(email: "user@email.com", password: "password")
u.save!

puts "Creating artist..."
a = Artist.new(name: "Relient K")
a.save!

puts "Creating Songs..."
s = Song.new(title: "Forget and Not Slow Down", artist: a)
s.save!

puts "Creating Practices..."
Practice.create!(user: u, song: s)

puts "Seed complete!"
