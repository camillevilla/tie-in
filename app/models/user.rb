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

  # accommodations
  has_and_belongs_to_many :accommodations
  has_many :created_accommodations, foreign_key: "creator_id", class_name: "Accommodation"

  # transits
  has_and_belongs_to_many :transits
  has_many :created_transits, foreign_key: "creator_id", class_name: "Transit"

  # events
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :sent_event_invitations, foreign_key: "sender_id", class_name: "EventInvitation"
  has_many :received_event_invitations, foreign_key: "recipient_id", class_name: "EventInvitation"

  # friends
  # has_and_belongs_to_many :friends, join_table: :friends, class_name: "User", foreign_key: "user_id", association_foreign_key: "other_user_id"
  # def add_friend(user)
  #   self.friends << user
  #   user.friends << self
  # end

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end

