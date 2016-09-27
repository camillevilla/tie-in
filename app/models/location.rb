class Location < ApplicationRecord
  has_many :accommodations
  has_many :events
end
