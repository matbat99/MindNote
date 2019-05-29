
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
queen = Artist.new(name: "Queen")
elo = Artist.new(name: "Electric Light Orchestra")
elo.save!
st=Artist.new(name: "Shania Twain")
st.save!
celine=Artist.new(name: "Celine Dion")
celine.save!
puts "5 artists created"


puts "Creating Songs..."
s = Song.new(title: "Forget and Not Slow Down", artist: a, album_url: "https://is3-ssl.mzstatic.com/image/thumb/Music/v4/77/bb/89/77bb8908-a158-cf32-66ab-e27d03931759/source/600x600bb.jpg")
s.save!
s2 = Song.new(title: "Another One Bites the Dust", artist: queen, album_url: "https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/7f/6f/36/7f6f3680-6bfe-3f13-aecb-99aa6a87848b/source/600x600bb.jpg")
s2.save!
s3 = Song.new(title: "Don't Bring Me Down", artist: elo, album_url: "https://is1-ssl.mzstatic.com/image/thumb/Music2/v4/ec/d7/88/ecd78889-af4b-bfed-5800-e6c7dd4ca19b/source/600x600bb.jpg")
s3.save!
s4 = Song.new(title: "Livin' Thing", artist: elo, album_url: "https://is1-ssl.mzstatic.com/image/thumb/Music2/v4/ec/d7/88/ecd78889-af4b-bfed-5800-e6c7dd4ca19b/source/600x600bb.jpg")
s4.save!
s5 = Song.new(title: "You're Still the One", artist: st, album_url: "https://is2-ssl.mzstatic.com/image/thumb/Music62/v4/51/e6/03/51e603a2-270b-6c98-6ba7-a64623163bec/source/600x600bb.jpg")
s5.save!
s6 = Song.new(title: "The Power of Love", artist: celine, album_url: "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/13/f8/2c/13f82c2e-dd56-0362-01d1-9aef0664976c/source/600x600bb.jpg")

puts " 6 songs created"

puts "Creating Practices..."
Practice.create!(user: u, song: s)
Practice.create!(user: u, song: s2)
Practice.create!(user: u, song: s3)
Practice.create!(user: u, song: s4)
Practice.create!(user: u, song: s5)
Practice.create!(user: u, song: s6)
puts "6 practices created"
puts "Seed complete!"
