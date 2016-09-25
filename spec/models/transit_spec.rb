require 'rails_helper'

RSpec.describe Transit, type: :model do
  describe "attributes" do
    it { should have_db_column(:creator_id) }
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:arrival) }
    # Polymorphic associations to be implemented after MVP
    # it { should have_db_column(:transit_id) }
    # it { should have_db_column(:transit_type) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:users) }
    it { should belong_to(:creator).class_name('User') }
    it { should belong_to(:trip) }
  end
end
