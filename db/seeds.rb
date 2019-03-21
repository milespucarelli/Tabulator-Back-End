# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  username: 'lord.zucc',
  email: 'zucc666@facebook.com',
  image: 'https://scontent-lga3-1.cdninstagram.com/vp/1043a5e5ce2f34e20a2c86c1c035b59a/5D4EFF5D/t51.2885-19/s150x150/42672345_358401964902367_800013778585387008_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com',
  password: '1234',
  bio: 'Definitely not a lizard person from Mars who feeds on data'
)

10.times do
  User.create(
    username: Faker::Internet.username(5..8),
    email: Faker::Internet.free_email,
    image: Faker::Avatar.image,
    password: '1234',
    bio: Faker::Lorem.paragraph(3)
  )
end
