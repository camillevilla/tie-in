class Accommodation < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :trip
  belongs_to :location
  belongs_to :creator, class_name: "User"

  
end
