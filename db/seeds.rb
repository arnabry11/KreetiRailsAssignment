# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Image.create([{
  created_at: "2019-07-24 15:35:58",
  updated_at: "2019-07-24 15:35:58",
  assignment_image_file_name: "lionel_messi_soccer_football-5120x2880.jpg",
  assignment_image_content_type: "image/jpeg",
  assignment_image_file_size: "1934353",
  assignment_image_updated_at: "2019-07-24 15:35:56"
}, {
  created_at: "2019-07-24 15:47:35",
  updated_at: "2019-07-24 15:47:35",
  assignment_image_file_name: "wallpapersden.com_pubg_7680x4320.jpg",
  assignment_image_content_type: "image/jpeg",
  assignment_image_file_size: "7077462",
  assignment_image_updated_at: "2019-07-24 15:47:30"
}, {
  created_at: "2019-07-24 15:48:03",
  updated_at: "2019-07-24 15:48:03",
  assignment_image_file_name: "img_up.jpg",
  assignment_image_content_type: "image/jpeg",
  assignment_image_file_size: "263426",
  assignment_image_updated_at: "2019-07-24 15:48:02"
}])

70.times do 
  Client.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    created_at: Faker::Time.between(DateTime.new(1970,01,01), DateTime.now),
    updated_at: Faker::Time.between(DateTime.new(1980,01,01), DateTime.now)
  }])
end

70.times do 
  Employee.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(10),
    created_at: Faker::Time.between(DateTime.new(1970,01,01), DateTime.now),
    updated_at: Faker::Time.between(DateTime.new(1980,01,01), DateTime.now)
  }])
end

70.times do 
  Student.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(10),
    created_at: Faker::Time.between(DateTime.new(1970,01,01), DateTime.now),
    updated_at: Faker::Time.between(DateTime.new(1980,01,01), DateTime.now)
  }])
end

70.times do 
  User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(10),
    created_at: Faker::Time.between(DateTime.new(1970,01,01), DateTime.now),
    updated_at: Faker::Time.between(DateTime.new(1980,01,01), DateTime.now)
  }])
end