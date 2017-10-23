# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  user_name = Faker::RickAndMorty.character
  Tweet.create!({
    tweet_id: rand(1..1000000000),
    tweet_url: 'http://example.com/',
    tweet_text: Faker::RickAndMorty.quote,
    user_name: user_name,
    user_handle: user_name.downcase.parameterize,
    user_picture_url: 'http://placehold.it/48x48',
    classification: 0
  })
end