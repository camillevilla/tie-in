# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def select_id(users)
  users.sample.id
end

User.destroy_all
Trip.destroy_all
Event.destroy_all
Accommodation.destroy_all

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

@users = User.all

10.times do
  Trip.create(
    creator_id: @users.sample.id,
    name: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.between(Date.today, 2.days.from_now),
    location: Faker::Address.city

  )
end

@trips = Trip.all

10.times do
  Event.create(
    trip_id: @trips.sample.id,
    creator_id: @users.sample.id,
    name: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    start_time: Faker::Date.between(DateTime.now - 1, DateTime.now),
    end_time: Faker::Date.between(DateTime.now, DateTime.now + 1),
    location: Faker::Address.city,
    privacy: false

  )
end

@friendships = Friendship.all

  Friendship.create(
    user_id: 1,
    friend_id: 10
    )


@accommodations = Accommodation.all

10. times do
  Accommodation.create(
    creator_id: @users.sample.id,
    trip_id: @trips.sample.id,
    location: ["Holiday-Inn", "The Ritz-Carlton", "Rented Airbnb", "Motel 6"].sample,
    check_in: Faker::Date.between(2.days.ago, Date.today),
    check_out: Faker::Date.between(Date.today, 2.days.from_now)
  )
end

