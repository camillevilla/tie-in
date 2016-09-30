#User
john = User.new(
  first_name: "John",
  last_name: "Smith",
  email: "john@john.com",
  password: "password"
)
gretchen = User.new(
  first_name: "Gretchen",
  last_name: "Wiener",
  email: "gretchen@gretchen.com",
  password: "password"
)
fabio = User.new(
  first_name: "The",
  last_name: "Fabio",
  email: "fabio@fabio.com",
  password: "password"
)

cameron = User.new(
  first_name: "Cameron",
  last_name: "Jones",
  email: "cameron@cameron.com",
  password: "password"
)

john.save
gretchen.save
fabio.save
cameron.save

#Friends
  # add a few people to friends

#Trip
  # primary <-- comment this out for the video
    # Vegas Hackathon
    Trip.create(
    creator_id: User.find(1),
    name: "Las Vegas Hackathon",
    description: "Boots on the road! DBC alums and friends are going to a weekend hackathon.",
    start_date: Faker::Date(90.days.from_now),
    end_date: Faker::Date(92.days.from_now),
    location_id: Location.find(1)
    )

  # secondary:
    Trip.create(
    creator_id: User.find(1),
    name: "Nellie's Wedding",
    description: "Nellie and Ryan are getting married!",
    start_date: Faker::Date(70.days.from_now),
    end_date: Faker::Date(72.days.from_now),
    location_id: Location.find(1)
    )

    Trip.create(
    creator_id: User.find(1),
    name: "San Diego Marathon",
    description: "It's been too long since we were all together!",
    start_date: Faker::Date(45.days.from_now),
    end_date: Faker::Date(47.days.from_now),
    location_id: Location.find(2)
    )

# Locations
  Location.create(
    name: "The Venetian",
    street_address_1: "3355 S Las Vegas Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89109",
    )

  Location.create(
    name: "Mandalay Bay",
    street_address_1: "3950 S Las Vegas Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89119",
    )

  Location.create(
    name: "Caesar's Palace",
    street_address_1: "3570 S Las Vegas Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89109",
    )

# Accommodations
  # 3 users staying at the same hotel
  Accommodation.create(
    creator_id: User.find(1),
    trip_id: Trip.find(1),
    location_id: Location.find(2),
    check_in: Faker::Date(89.days.from_now),
    check_out: Faker::Date(91.days.from_now)
  )

  Accommodation.find(1).users << john
  Accommodation.find(1).users << gretchen

  # solo user
  Accommodation.create(
    creator_id: User.find(3),
    trip_id: Trip.find(1),
    location_id: Location.find(3),
    check_in: Faker::Date(89.days.from_now),
    check_out: Faker::Date(91.days.from_now)
  )

  Accommodation.find(2).users << fabio

# Transits
  # 2 users arriving on the same flight
  # Transit.create(
  #   creator_id: User.find(1),
  #   trip_id: Trip.find(1),
  #   arrival: ,
  #   airline: ,
  #   flight_number: ,
  #   origin: ,
  #   destination: ,
  #   transit_type: ,
  #   start_time: ,
  #   end_time:
  #   )

  # Transit.find(1).users << john
  # Transit.find(1).users << gretchen

  # 1 user
#



# Events

  # breakfast yoga
  # latenight club

  # add attendees to each event so they show up
