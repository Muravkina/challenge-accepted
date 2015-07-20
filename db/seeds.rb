# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

User.create ([{
      email: 'muravkina@yahoo.com',
      username: "Muravkina",
      password: 'password',
      location: "Brooklyn",
      gender: "female",
      birth_date: 'Feb 10 1989',
      phone_number: '347-777-0584',
      first_name: "Dasha",
      last_name: "Murauyova"
    },
    {
      email: 'als@gmail.com',
      username: "ALS association",
      password: 'password',
      location: "New York",
      gender: "female",
      birth_date: 'Feb 10 1970',
      phone_number: '347-777-0584',
      first_name: "ALS association"
    }])


10.times do
  User.create ({
      email: FFaker::Internet.email,
      username: FFaker::InternetSE.user_name_random,
      password: 'password',
      location: FFaker::Address.city,
      gender: FFaker::Gender.random,
      birth_date: 'Feb 10 2015',
      phone_number: FFaker::PhoneNumber.short_phone_number,
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name
    })
end

Challenge.create([
  {
    creator_id: 2,
    name: "Ice Bucket Challenge",
    img_url: 'https://localtvwjw.files.wordpress.com/2014/08/icebucket.jpg?w=1200',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one week',
    proof_description: "Video",
    description: "You'll want to prepare frozen water, liquid water, a bucket, and, of course, a courage. Before you dump the bucket of ice water over your head, make sure you're recording the challenge"
  },
  {
    creator_id: 3,
    name: "Running Challenge",
    img_url: 'http://musclematters.ca/wp-content/uploads/2012/06/fi_Running-for-Beginners.jpg',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one week',
    proof_description: "Photo",
    description: "Stay in shape with this running challenge! Run at least 3 times this week and upload a photo of yourself or the area where you ran to the challenge page."
  },
  {
    creator_id: 3,
    name: "How fast can you peel?",
    img_url: 'https://s-media-cache-ak0.pinimg.com/736x/de/12/63/de1263d4ef66e9552ea6b132828cb92b.jpg',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one month',
    proof_description: "Video",
    description: "Each participant must peel an orange as fast as he or she can. Note: The orange must be the same size for each participant"
  },
  {
    creator_id: 1,
    name: "High Five",
    img_url: 'https://therantommenace.files.wordpress.com/2012/05/high-five-to-the-face1.jpg',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one week',
    proof_description: "Video",
    description: "Teach your pet to give a high five"
  },
  {
    creator_id: 1,
    name: "The Cold Water Challenge",
    img_url: 'http://www.liweiart.com/works_pic/photo_big_pic/044-01.jpg',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one day',
    proof_description: "Video",
    description: "Dunk your entire body into a freezing cold body of water, then challenge someone else to do it in 24 hours."
  },
  {
    creator_id: 3,
    name: "The Cinnamon",
    img_url: 'http://www.bioedonline.org/BioEd/cache/file/69E57A28-1626-46A6-8BAF19EFE755F576.jpg',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one day',
    proof_description: "Video",
    description: "The objective of the challenge is to film oneself swallowing a spoonful of ground cinnamon in under 60 seconds without drinking anything, then upload the video..."
  }
])

