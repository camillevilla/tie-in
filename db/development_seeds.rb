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
Location.destroy_all

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

@users = User.all

5.times do
  Location.create(
    name: Faker::Company.name,
    street_address_1: Faker::Address.street_address,
    street_address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip,
    )
end

@locations = Location.all

10.times do
  Trip.create(
    creator_id: @users.sample.id,
    name: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.between(Date.today, 2.days.from_now),
    location_id: @locations.sample.id,

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
    location_id: @locations.sample.id,
    privacy: false

  )
end

  Friendship.create(
    user_id: 1,
    friend_id: 10
    )

@friendships = Friendship.all

10.times do
  Accommodation.create(
    creator_id: @users.sample.id,
    trip_id: @trips.sample.id,
    location_id: @locations.sample.id,
    check_in: Faker::Date.between(2.days.ago, Date.today),
    check_out: Faker::Date.between(Date.today, 2.days.from_now)
  )
end

@accommodations = Accommodation.all
@accommodations.each do |accommodation|
  accommodation.users << accommodation.creator
end

# Timeline test data

lid = Location.first.id

nick = User.create(
  first_name: "Nick",
  last_name: "Davidson",
  email: "nick@nick.com",
  password: "password"
)

dave = User.create(
  first_name: "David",
  last_name: "Ross",
  email: "dave@dave.com",
  password: "password"
)

jeff = User.create(
  first_name: "Jeff",
  last_name: "Roy",
  email: "jeff@jeff.com",
  password: "password"
)

camille = User.create(
  first_name: "Camille",
  last_name: "Villa",
  email: "camille@camille.com",
  password: "password"
)

nick.friends << dave
nick.friends << jeff
nick.friends << camille
dave.friends << nick
dave.friends << jeff
dave.friends << camille
jeff.friends << dave
jeff.friends << nick
jeff.friends << camille
camille.friends << dave
camille.friends << jeff
camille.friends << nick



uid = User.last.id

dbc = Trip.create(
  creator_id: uid,
  name: "Dev Bootcamp",
  description: "Learn to be a web developer!",
  start_date: 1.day.ago,
  end_date: 1.day.from_now,
  location_id: lid
)
p dbc

dbc.users << nick
dbc.users << dave
dbc.users << jeff
dbc.users << camille

p1 = Event.create(
  trip_id: dbc.id,
  creator_id: uid,
  name: "Phase 1",
  description: "Phase 1",
  start_time: 1.day.ago,
  end_time: DateTime.now,
  location_id: lid,
  privacy: false
)

p1.users << nick
p1.users << dave
p1.users << jeff


p2 = Event.create(
  trip_id: dbc.id,
  creator_id: uid,
  name: "Phase 2",
  description: "Phase 2",
  start_time: DateTime.now,
  end_time: 1.day.from_now,
  location_id: lid,
  privacy: false
)

p2.users << dave
p2.users << camille




