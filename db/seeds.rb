# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

User.create ([{
      email: 'dashamuravjova@gmail.com',
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

Challenge.create({
    creator_id: 2,
    name: "Ice Bucket Challenge",
    img_url: 'https://localtvwjw.files.wordpress.com/2014/08/icebucket.jpg?w=1200',
    is_public: true,
    is_proof_required: true,
    location: "All over the globe",
    time_limit: 'one week',
    proof_description: "Video",
    description: "You'll want to prepare frozen water, liquid water, a bucket, and, of course, a courage. Before you dump the bucket of ice water over your head, make sure you're recording the challenge"
  })

