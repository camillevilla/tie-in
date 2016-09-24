require 'rails_helper'

RSpec.describe Accommodation, type: :model do
  describe "attributes" do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:location) }
    it { should have_db_column(:check_in) }
    it { should have_db_column(:check_out) }
  end
end
