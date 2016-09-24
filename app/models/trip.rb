class Trip < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
end
