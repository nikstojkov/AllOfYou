locations = ["Bristol", "London", "Reading", "York", "Newcastle"]

user_tags = ["male", "female"]

pronouns_list = ["She", "Her", "Hers", "Herself", "He", "Him", "His", "Himself", "They", "Them", "Theirs", "Themself"]

puts "Cleaning DB"

Application.destroy_all
Opportunity.destroy_all
Shortlist.destroy_all
Artwork.destroy_all
Artist.destroy_all
User.destroy_all

puts "-------------"
puts "User Creation"
puts "-------------"

5.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  user = User.create!(
    first_name: first,
    last_name: last,
    email: "#{first}.#{last}@everyone.com",
    password: "User123",
    location: locations.sample
  )
  puts "User with id #{user.id} created"
end

puts "----------"
puts "Users done"
puts "----------"
puts ""
puts "--------------------"
puts "Opportunity Creation"
puts "--------------------"

10.times do
  opportunity = Opportunity.create!(
    user_id: User.all.ids.sample,
    title: Faker::Book.title,
    location: locations.sample,
    description: Faker::Lorem.paragraph_by_chars(number: rand(150..250))
  )
  puts "Opportunity with id #{opportunity.id} created"
end

puts "------------------"
puts "Opportunities done"
puts "------------------"
puts ""
puts "----------------"
puts "Artists Creation"
puts "----------------"

10.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  artist = Artist.create!(
    first_name: first,
    last_name: last,
    email: "#{first}.#{last}@artists.com",
    password: "Artist123",
    bio: Faker::Lorem.paragraph_by_chars(number: rand(150..250), supplemental: false),
    location: locations.sample,
    pronouns: pronouns_list.sample(3)
  )
  puts "Artist with id #{artist.id} created"
end

puts "------------"
puts "Artists done"
puts "------------"
puts ""
puts "----------------"
puts "Artwork Creation"
puts "----------------"

100.times do
  artwork = Artwork.create!(
    artist_id: Artist.all.ids.sample,
    name: Faker::Verb.base,
    genre: Faker::Book.genre
  )
  puts "Artwork with id #{artwork.id} created"
end

puts "-------------"
puts "Artworks done"
puts "-------------"
puts ""
puts "--------------------"
puts "Application Creation"
puts "--------------------"

10.times do
  application = Application.create!(
    opportunity_id: Opportunity.all.ids.sample,
    artist_id: Artist.all.ids.sample,
    content: "Hi I'm interested, please take a look at my profile"
  )
  puts "Application with id #{application.id} created"
end

puts "----------------"
puts "Applications done"
puts "----------------"
puts ""
puts "------------------"
puts "Shortlist Creation"
puts "------------------"

10.times do
  opportunity = Opportunity.find(Opportunity.all.ids.sample)
  shortlist = Shortlist.create!(
    name: opportunity.title,
    user_id: User.all.ids.sample
  )
  puts "Shortlist with id #{shortlist.id} created"
end

puts "----------------"
puts "Shortlists done"
puts "----------------"
