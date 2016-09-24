require 'rails_helper'

RSpec.describe Event, type: :model do
    describe "attributes" do
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:creator_id) }
    it { should have_db_column(:name) }
    it { should have_db_column(:description) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
    it { should have_db_column(:location) }
    it { should have_db_column(:private) }
  end
end
