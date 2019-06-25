# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  username: 'miles.of.code',
  email: 'miles.pucarelli@gmail.com',
  image: 'https://media.licdn.com/dms/image/C4D03AQF1go_DzUJHzw/profile-displayphoto-shrink_200_200/0?e=1567036800&v=beta&t=4N-zq2kD_9Hdeb1eYY03K1zYpGipFtkFh_U6zbfGxww',
  password: '1234',
  bio: 'Creator of Tabulator. Plays drums in two bands and guitar in another. Always looking to collaborate.'
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
