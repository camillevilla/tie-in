class Trip < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :location_id, presence: true
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
  # Define users by hand using accepted invitations
  # def users
  #   accepted_invitations = trip_invitations.select { |invitation| invitation.accepted }
  #   accepted_invitations.map { |invitation| invitation.recipient_id }
  # end
  has_many :trip_invitations
  has_many :events
  has_many :accommodations
  has_many :transits
  belongs_to :location
end
