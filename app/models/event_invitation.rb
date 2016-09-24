class EventInvitation < ApplicationRecord
  belongs_to :event
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
