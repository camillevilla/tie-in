class Location < ApplicationRecord
  has_many :accommodations
  has_many :events
  has_many :trips
end
