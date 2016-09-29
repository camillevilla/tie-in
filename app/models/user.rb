class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # trips
  has_and_belongs_to_many :trips
  has_many :created_trips, foreign_key: "creator_id", class_name: "Trip"
  has_many :sent_trip_invitations, foreign_key: "sender_id", class_name: "TripInvitation"
  has_many :received_trip_invitations, foreign_key: "recipient_id", class_name: "TripInvitation"
  # def trips
  #   accepted_invitations = received_trip_invitations.select { |invitation| invitation.accepted }
  #   accepted_invitations.map { |invitation| invitation.trip_id }
  # end

  # accommodations
  has_and_belongs_to_many :accommodations
  has_many :created_accommodations, foreign_key: "creator_id", class_name: "Accommodation"

  # transits
  has_and_belongs_to_many :transits
  has_many :created_transits, foreign_key: "creator_id", class_name: "Transit"

  # events
  has_and_belongs_to_many :events
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :sent_event_invitations, foreign_key: "sender_id", class_name: "EventInvitation"
  has_many :received_event_invitations, foreign_key: "recipient_id", class_name: "EventInvitation"
  # def events
  #   accepted_invitations = received_event_invitations.select { |invitation| invitation.accepted }
  #   accepted_invitations.map { |invitation| invitation.event_id }
  # end

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def events_for(trip)
    events.select { |event| event.trip_id == trip.id }
  end

  # Helper method generates data for timeline
  # Returns string containing JavaScript code
  def timeline_row(event)
    row = "[ '"
    row << first_name
    row << "', '"
    row << event.name
    row << "', new Date('"
    row << event.start_time.to_s
    row << "'), new Date("
    row << event.end_time.to_s
    row << "') ]"
    row
  end
end

