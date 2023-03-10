locations = ["Bristol", "London", "Reading", "York", "Newcastle"]

user_tags = ["male", "female"]



tags = %w('abstract aethetic angular avant-guard baroque bold contemporary
  creative cubist dynamic enigmatic expressive geometric inspiring linear
  minimalist modern monochromatic multimedia muted naturalistic portrait
  profound realistic representational rococo somber still-life sublime surreal
  symmetrical tactile uniqe vibrant vivid absorbing
  abstract acclaimed accomplished adroit aesthetic
  aesthetically pleasing aggressive appealing artistic astonishing
  atmospheric authentic avant-garde award-winning awe-inspiring balanced baroque
  beautiful bold boundless brilliant candid ceramic characteristic classic
  collectable colorful complementary complex conceptual contemplative
  contemporary controversial conversational creative daring dazzling
  decorative deeply thoughtful delicate dense detailed dimensional disciplined
  disruptive distinctive distinguished divine dreamlike dreamy dynamic eclectic
  elevated elevating emergent emerging emotional emotionally charged enchanted
  energetic engaging engrossing enigmatic epochal ethereal evocative
  exceptional exotic explosive expressive extreme fascinating figural
  figurative fluid freelance fresh gorgeous graceful granular honest human
  hyper-creative imaginative impassioned impeccable impressionist infused
  inspirational inspired instinctive intellectual intense intensive
  interesting intuitive inventive labyrinthine layered lifelike literal
  luminous lyrical mature meandering mosaic-like moving mysterious mystical
  narrative organic original paradoxical passionate peaceful personal
  phenomenal pictorial playful potent profound provoking pure radiant realistic
  refined refreshing remarkable resourceful revealing rich romantic saturated
  sculptural semi-abstract sensual serene signature simple skilled soft sparse
  spiritual stimulating stirring studied stunning sublime substantive supple
  surreal symbolic tactile talented tasteful textile thought-provoking
  timeless touching traditional tranquil unconventional unexpected
  unforgettable unique universal unpredictable varied visionary visual
  visually stimulating voyeuristic'
)

pronouns_list = ["She", "Her", "Hers", "Herself", "He", "Him", "His", "Himself", "They", "Them", "Theirs", "Themself"]

puts "Cleaning DB"


Application.destroy_all
Opportunity.destroy_all
Shortlist.destroy_all
Artwork.destroy_all
Artist.destroy_all
User.destroy_all
Tag.destroy_all

puts "-------------"
puts "Tags Creation"
puts "-------------"

tags.uniq.each do |tag|
  Tag.create!(name: tag)
end
puts "-------------"
puts "Tags DONE----"
puts "-------------"

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
    description: Faker::Lorem.paragraph_by_chars(number: rand(150..250), supplemental: false)
  )
  Tag.all.sample(5).each do |tag|
    OpportunityTag.create!(opportunity_id: opportunity.id, tag_id: tag.id)
  end
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
    pronouns: pronouns_list.sample(3).join(" / ")
  )
  Tag.all.sample(5).each do |tag|
    ArtistTag.create!(artist_id: artist.id, tag_id: tag.id)
  end
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
  Tag.all.sample(5).each do |tag|
    ArtworkTag.create!(artwork_id: artwork.id, tag_id: tag.id)
  end
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
  shortlist = Shortlist.create!(
    name: Faker::Book.title,
    user_id: User.all.ids.sample
  )
  Artist.all.sample(5).each do |artist|
    ShortlistedArtist.create!(artist_id: artist.id, shortlist_id: shortlist.id)
  end
  puts "Shortlist with id #{shortlist.id} created"
end

puts "----------------"
puts "Shortlists done"
puts "----------------"
