FactoryGirl.define do
  factory :event do
    trip_id 1
    creator_id 1
    name "MyString"
    description "MyText"
    start_time "2016-09-23 10:52:45"
    end_time "2016-09-23 10:52:45"
    location_id 1
    privacy false
  end
end
