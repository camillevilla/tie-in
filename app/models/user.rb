class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_many :created_trips, foreign_key: "creator_id", class_name: "Trip"
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :sent_invitations, foreign_key: "sender_id", class_name: "EventInvitation"
  has_many :received_invitations, foreign_key: "recipient_id", class_name: "EventInvitation"
end
