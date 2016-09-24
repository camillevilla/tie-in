class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_and_belongs_to_many :accommodations
  has_many :created_trips, foreign_key: "creator_id", class_name: "Trip"
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :created_accommodations, foreign_key: "creator_id", class_name: "Accommodation"
  has_many :sent_event_invitations, foreign_key: "sender_id", class_name: "EventInvitation"
  has_many :received_event_invitations, foreign_key: "recipient_id", class_name: "EventInvitation"
  has_many :sent_trip_invitations, foreign_key: "sender_id", class_name: "TripInvitation"
  has_many :received_trip_invitations, foreign_key: "recipient_id", class_name: "TripInvitation"
end
