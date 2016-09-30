class Event < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :creator, class_name: "User"
  has_many :event_invitations
  belongs_to :trip
  belongs_to :location
  has_and_belongs_to_many :users

  # Define users by hand using accepted invitations
  # def users
  #   accepted_invitations = event_invitations.select { |invitation| invitation.accepted }
  #   accepted_invitations.map { |invitation| invitation.recipient_id }
  # end

  def location_json
    {
      name: name,
      coordinates: location.coordinates
    }
  end

end
