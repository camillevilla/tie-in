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

  # Return array containing trip data
  # To be converted to JSON for use with timeline
  def json_data
    data = []
    # Loop through all users
    users.each do |user|
      event_data = []
      # Loop through all events for user
      user.events_for(self).each do |event|
        # Add event data to user list
        event_data << {
          id: event.id,
          label: event.name,
          starting_time: event.start_time.to_i,
          ending_time: event.end_time.to_i,
        }
      end
      # Add user data to list
      data << {
        label: user.first_name,
        times: event_data
      }
    end
    p "*"*80
    p data
    data
  end

  def location_json
    {
      name: name,
      coordinates: location.coordinates
    }
  end

  def all_locations_json
    location_array = [location_json]
    accommodations.each do |accommodation|
      location_array << accommodation.location_json
    end
    events.each do |event|
      location_array << event.location_json
    end
    location_array
  end
end
