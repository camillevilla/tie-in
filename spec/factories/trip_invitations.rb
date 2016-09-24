FactoryGirl.define do
  factory :trip_invitation do
    sender_id 1
    recipient_id 1
    trip_id 1
    accepted false
  end
end
