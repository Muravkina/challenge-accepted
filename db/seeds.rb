# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

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

4.times do
  Challenge.create({
    creator_id: 1,
    name: FFaker::BaconIpsum.word,
    is_public: true,
    is_proof_required: true,
    location: FFaker::Address.city,
    time_limit: 'one week',
    proof_description: FFaker::HipsterIpsum.sentence,
    description: FFaker::HipsterIpsum.paragraph
  })
end


  Challenge.create([
  {
    creator_id: 2,
    name: FFaker::BaconIpsum.word,
    is_public: true,
    is_proof_required: true,
    location: FFaker::Address.city,
    time_limit: 'one week',
    proof_description: FFaker::HipsterIpsum.sentence,
    description: FFaker::HipsterIpsum.paragraph
  },
  {
    creator_id: 1,
    name: FFaker::BaconIpsum.word,
    is_public: true,
    is_proof_required: true,
    location: FFaker::Address.city,
    time_limit: 'one week',
    proof_description: FFaker::HipsterIpsum.sentence,
    description: FFaker::HipsterIpsum.paragraph
  },
  ])


20.times do
  Tag.create({
    challenge_id: rand(1..2),
    name: FFaker::Lorem.word
    })
end


  AcceptedChallenge.create([
  {
    challenge_id: 1,
    is_accomplished: true,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 2
  },
  {
    challenge_id: 1,
    is_accomplished: true,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 3
  },
  {
    challenge_id: 1,
    is_accomplished: false,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 5
  },
  {
    challenge_id: 2,
    is_accomplished: false,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 1
  },
  {
    challenge_id: 2,
    is_accomplished: true,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 4
  },
  {
    challenge_id: 2,
    is_accomplished: true,
    remark: FFaker::BaconIpsum.phrase,
    user_id: 6
  }
  ])


  Proof.create([
  {
    accepted_challenge_id: 1,
    proof_url: "http://gallery.photo.net/photo/2439912-lg.jpg"
  },
  {
    accepted_challenge_id: 1,
    proof_url: "http://www.hdwallpapersimages.com/wp-content/uploads/images/Child-Girl-with-Sunflowers-Images.jpg"
  },
  {
    accepted_challenge_id: 2,
    proof_url: "http://www.hdwallpapersimages.com/wp-content/uploads/images/201/Udaan-Colors-TV-Show-Images.jpg"
  },
  {
    accepted_challenge_id: 2,
    proof_url: "http://www.moviehdwallpapers.com/wp-content/uploads/2014/10/McGowanImages_ChristinaJordanEngagement_02.jpg"
  },
  {
    accepted_challenge_id: 5,
    proof_url: "http://i.dailymail.co.uk/i/pix/2015/01/06/2473100D00000578-2898639-Photographer_Andrey_Gudkov_snapped_the_images_on_the_plains_of_t-a-20_1420546215677.jpg"
  },
  {
    accepted_challenge_id: 5,
    proof_url: "http://www.menucool.com/slider/prod/image-slider-2.jpg"
  },
  {
    accepted_challenge_id: 6,
    proof_url: "http://data.hdwallpapers.im/creativity_water_spray_drops_flower_rose_desktop_images.jpg"
  },
  {
    accepted_challenge_id: 6,
    proof_url: "http://www.hdwallpapersimages.com/wp-content/uploads/images/Frozen-Logo-Symbol-HD-Images.jpg"
  }
  ])



