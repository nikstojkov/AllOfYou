require "open-uri"
require "json"
require "cloudinary"

def random_face_url
  image = Cloudinary::Api.resources(type: 'upload', max_results: 500, prefix: 'faces')['resources'].sample['url']
  return image
end

def random_art_url
  image = Cloudinary::Api.resources(type: 'upload', max_results: 500, prefix: 'artwork')['resources']
  return image
end

@all_artwork = random_art_url
p @all_artwork.count

def random_opp_url
  image = Cloudinary::Api.resources(type: 'upload', max_results: 500, prefix: 'opps')['resources'].sample['url']
  return image
end

url = "https://collectionapi.metmuseum.org/public/collection/v1/search?hasImages=true&medium=Paintings&departmentId=11&q=Painting"

painting_ids = JSON.parse(URI.open(url).read)["objectIDs"].sample(100)
p painting_ids


locations = ["Bristol", "London", "Reading", "York", "Newcastle"]

identity_tags = %w(working-class millenial gen-z lgbtq trans woc)
medium_tags = %w(watercolour oil digital acrylic photography sculpture)



tags = %w('abstract aesthetic angular avant-garde baroque bold contemporary
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

pronouns_list = ["she / her", "he / him", "they / them"]

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

hashtags = tags.uniq.map do |tag|
  Tag.create!(name: tag)
end

medium_taggs = medium_tags.map do |tag|
  Tag.create!(name: tag)
end
identity_taggs = identity_tags.map do |tag|
  Tag.create!(name: tag)
end

p medium_taggs

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
    description: Faker::Lorem.paragraph_by_chars(number: rand(150..250), supplemental: false),
    date: Date.today + rand(1..10),
    opp_image: random_opp_url
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

15.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  artist = Artist.create!(
    first_name: first,
    last_name: last,
    email: "#{first}.#{last}@artists.com",
    password: "Artist123",
    bio: Faker::Lorem.paragraph_by_chars(number: rand(150..250), supplemental: false),
    location: locations.sample,
    pronouns: pronouns_list.sample,
    profile_image: random_face_url
  )
  Tag.all.sample(5).each do |tag|
    ArtistTag.create!(artist_id: artist.id, tag_id: tag.id)
  end
  medium_taggs.sample(2).each do |tag|
    ArtistTag.create!(artist_id: artist.id, tag_id: tag.id)
  end
  identity_taggs.sample(2).each do |tag|
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

# painting_ids.each do |id|
#   data = JSON.parse(URI.open("https://collectionapi.metmuseum.org/public/collection/v1/objects/#{id}").read)
#   unless data["primaryImageSmall"] == ""
#     artwork = Artwork.create!(
#       artist_id: Artist.all.ids.sample,
#       name: data["title"],
#       genre: Faker::Book.genre,
#       image_url: random_art_url
#     )
#     hashtags.sample(5).each do |tag|
#       ArtworkTag.create!(artwork_id: artwork.id, tag_id: tag.id)
#     end
#     ArtworkTag.create!(artwork_id: artwork.id, tag_id: medium_taggs.sample.id)
#     puts "Artwork with id #{artwork.id} created"
#   end
# end

# p @all_artwork

@all_artwork.each do |artwork|
  new_artwork = Artwork.create!(
    artist_id: Artist.all.ids.sample,
    name: Faker::Verb.base.capitalize,
    genre: Faker::Book.genre,
    image_url: artwork['url']
   )
    hashtags.sample(5).each do |tag|
      ArtworkTag.create!(artwork_id: new_artwork.id, tag_id: tag.id)
    end
      ArtworkTag.create!(artwork_id: new_artwork.id, tag_id: medium_taggs.sample.id)
      puts "Artwork with id #{new_artwork.id} created"
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


# 10.times do
#   shortlist = Shortlist.create!(
#     name: Faker::Book.title,
#     user_id: User.all.ids.sample
#   )

# end

User.all.each do |user|
  shortlist = Shortlist.create!(name: "My Shortlist", user_id: user.id)
  puts "Shortlist with id #{shortlist.id} created"

  Artist.all.sample(rand(0..2)).each do |artist|
    ShortlistedArtist.create!(artist_id: artist.id, shortlist_id: shortlist.id)
  end
end

puts "----------------"
puts "Shortlists done"
puts "----------------"
