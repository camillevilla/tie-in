class Transit < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: "User"
  belongs_to :trip
end
