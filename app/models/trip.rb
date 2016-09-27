class Trip < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
  has_many :trip_invitations
  has_many :events
  has_many :accommodations
  has_many :transits
end
