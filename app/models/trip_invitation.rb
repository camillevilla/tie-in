class TripInvitation < ApplicationRecord
  belongs_to :trip
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
