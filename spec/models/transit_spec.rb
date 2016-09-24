require 'rails_helper'

RSpec.describe Transit, type: :model do
  describe "attributes" do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:arrival) }
    it { should have_db_column(:transit_id) }
    it { should have_db_column(:transit_type) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
  end
end
