class Trip < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
  has_many :trip_invitations
  has_many :events
  has_many :accommodations
end
