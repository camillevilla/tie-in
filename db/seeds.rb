require 'date'

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

regina = User.new(
  first_name: "Regina",
  last_name: "George",
  email: "regina@george.com",
  password: "password"
)

john.save
gretchen.save
fabio.save
cameron.save
regina.save

#Friends
  # add a few people to friends

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

  Location.create(
  name:"Planet Hollywood",
  street_address_1: "3667 S Las Vegas Blvd",
  city: "Las Vegas",
  state: "NV",
  zipcode: "89109"
)

  Location.create(
    name:"Share Nightclub",
    street_address_1: "4636 Wynn Rd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "90103"
  )

  Location.create(
    name:"McCarren International",
    street_address_1: "5757 Wayne Newton Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89119"
  )

  Location.create(
    name:"Vdara Hotel & Spa",
    street_address_1: "2600 W Harmon Ave",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89158"
  )

  Location.create(
    name:"Tropicana Hotel",
    street_address_1: "3801 S Las Vegas Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89109"
  )

  Location.create(
    name:"Encore Beach Club",
    street_address_1: "3131 S Las Vegas Blvd",
    city: "Las Vegas",
    state: "NV",
    zipcode: "89109"
  )



#Trip
  # primary <-- comment this out for the video
    # Vegas Hackathon
    Trip.create(
    creator_id: 1,
    name: "Las Vegas Hackathon",
    description: "Boots on the road! DBC alums and friends are going to a weekend hackathon.",
    start_date: DateTime.new(2016,10,21,8,30),
    end_date: DateTime.new(2016,10,23,15,30),
    location_id: 1
    )

    # add attendees to trip
    Trip.find(1).users << john
    Trip.find(1).users << gretchen
    Trip.find(1).users << fabio
    Trip.find(1).users << cameron
    Trip.find(1).save

  # secondary:
    Trip.create(
    creator_id: 1,
    name: "Nellie's Wedding",
    description: "Nellie and Ryan are getting married!",
    start_date: DateTime.new(2016,11,11,8,30),
    end_date: DateTime.new(2016,11,13,15,30),
    location_id: 1
    )

    Trip.create(
    creator_id: 1,
    name: "San Diego Marathon",
    description: "It's been too long since we were all together!",
    start_date: DateTime.new(2016,12,10,8,30),
    end_date: DateTime.new(2016,12,14,12,30),
    location_id: 2
    )

    Trip.find(2).users << cameron
    Trip.find(2).save
    Trip.find(3).users << cameron
    Trip.find(3).save

# Accommodations
  # 3 users staying at the same hotel
  Accommodation.create(
    creator_id: 1,
    trip_id: 1,
    location_id: 2,
    check_in: DateTime.new(2016,10,19,8,30),
    check_out: DateTime.new(2016,10,23,15,30)
  )

  Accommodation.find(1).users << john
  Accommodation.find(1).users << gretchen
  Accommodation.find(1).save

  # solo user
  Accommodation.create(
    creator_id: 3,
    trip_id: 1,
    location_id: 3,
    check_in: DateTime.new(2016,10,20,8,30),
    check_out: DateTime.new(2016,10,25,15,30)
  )

  Accommodation.find(2).users << fabio
  Accommodation.find(2).save

  Accommodation.create(
    creator_id: 3,
    trip_id: 1,
    location_id: 7,
    check_in: DateTime.new(2016,10,20,8,30),
    check_out: DateTime.new(2016,10,25,15,30)
  )

  Accommodation.create(
    creator_id: 3,
    trip_id: 1,
    location_id: 8,
    check_in: DateTime.new(2016,10,20,8,30),
    check_out: DateTime.new(2016,10,25,15,30)
  )

# Transits
  # 2 users arriving on the same flight
  Transit.create(
    creator_id: 1,
    trip_id: 1,
    arrival: true,
    airline: "SWA",
    flight_number: 970,
    origin: "San Francisco",
    destination: "Las Vegas",
    start_time: DateTime.new(2016,10,19,4,30),
    end_time: DateTime.new(2016,10,19,6,30)
    )

    Transit.create(
    creator_id: 1,
    trip_id: 1,
    arrival: false,
    airline: "SWA",
    flight_number: 948,
    origin: "Las Vegas",
    destination: "San Francisco",
    start_time: DateTime.new(2016,10,23,17,30),
    end_time: DateTime.new(2016,10,23,19,30)
    )

    Transit.find(1).users << john
    Transit.find(1).users << gretchen
    Transit.find(1).save

    Transit.find(2).users << john
    Transit.find(2).users << gretchen
    Transit.find(2).save

  # 1 user
  Transit.create(
    creator_id: 3,
    trip_id: 3,
    arrival: true,
    airline: "United",
    flight_number: 908,
    origin: "Seattle",
    destination: "Las Vegas",
    start_time: DateTime.new(2016,10,20,5,30),
    end_time: DateTime.new(2016,10,20,7,30)
    )

    Transit.create(
    creator_id: 3,
    trip_id: 3,
    arrival: false,
    airline: "United",
    flight_number: 972,
    origin: "Las Vegas",
    destination: "Seattle",
    start_time: DateTime.new(2016,10,25,17,30),
    end_time: DateTime.new(2016,10,25,20,30)
    )

    Transit.find(3).users << fabio
    Transit.find(4).users << fabio

# Events

  # breakfast yoga
  morning_yoga = Event.create(
  trip_id: 1,
  creator_id: 1,
  name: "Morning Poolside Yoga",
  description: "Let's center ourselves before a day of staring at our screens.",
  start_time: DateTime.new(2016,10,21,6,30),
  end_time: DateTime.new(2016,10,21,9,30),
  location_id: 2,
  privacy: false
  )

  Event.find(1).users << john
  Event.find(1).users << cameron
  Event.find(1).save

  # latenight club
  da_club = Event.create(
  trip_id: 1,
  creator_id: 3,
  name: "Head to a Bar",
  description: "We'll be sitting all day! Let's go dancing.",
  start_time: DateTime.new(2016,10,23,22,30),
  end_time: DateTime.new(2016,10,24,2,30),
  location_id: 3,
  privacy: false
  )

  Event.find(2).users << gretchen
  Event.find(2).users << fabio
  Event.find(2).save

  #winedown
  wine_down = Event.create(
  trip_id: 1,
  creator_id: 2,
  name: "Wine Down",
  description: "Winedown winedown winedown!",
  start_time: DateTime.new(2016,10,21,10,30),
  end_time: DateTime.new(2016,10,21,13,30),
  location_id: 1,
  privacy: false
  )

  Event.find(3).users << gretchen
  Event.find(3)

  #karaoke
  karaoke = Event.create(
  trip_id: 1,
  creator_id: 1,
  name: "Karaoke",
  description: "You know the drill.",
  start_time: DateTime.new(2016,10,21,15,30),
  end_time: DateTime.new(2016,10,21,18,30),
  location_id: 2,
  privacy: false
  )

  Event.find(3).users << john
  Event.find(3).users << gretchen
  Event.find(3)

  #britney
  britney_betch = Event.create(
  trip_id: 1,
  creator_id: 2,
  name: "Britney, Betch",
  description: "OMG.",
  start_time: DateTime.new(2016,10,22,8,30),
  end_time: DateTime.new(2016,10,22,10,30),
  location_id: 4,
  privacy: false
  )

  Event.find(4).users << fabio
  Event.find(4).users << gretchen
  Event.find(4)

  #dranks
  share = Event.create(
  trip_id: 1,
  creator_id: 1,
  name: "Drinks at Share",
  description: "Drinks and dancing",
  start_time: DateTime.new(2016,10,22,12,30),
  end_time: DateTime.new(2016,10,22,15,30),
  location_id: 5,
  privacy: false
  )

  Event.find(5).users << regina
  Event.find(5).users << gretchen
  Event.find(5)

  # mccarren
  mccarren = Event.create(
  trip_id: 1,
  creator_id: 2,
  name: "Premier Lounge",
  description: "Let's use my platinum card and go to the United lounge.",
  start_time: DateTime.new(2016,10,22,18,30),
  end_time: DateTime.new(2016,10,22,21,30),
  location_id: 5,
  privacy: false
  )

  Event.find(6).users << gretchen
  Event.find(6).users << john
  Event.find(6)

  skrillex = Event.create(
  trip_id: 1,
  creator_id: 3,
  name: "Encore Beach Club",
  description: "Music, music, music",
  start_time: DateTime.new(2016,10,23,8,30),
  end_time: DateTime.new(2016,10,23,10,30),
  location_id: 5,
  privacy: false
  )

  Event.find(7).users << gretchen
  Event.find(7).users << regina
  Event.find(7)
