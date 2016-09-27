require 'rails_helper'

RSpec.describe Accommodation, type: :model do
  describe "attributes" do
    it { should have_db_column(:creator_id) }
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:location_id) }
    it { should have_db_column(:check_in) }
    it { should have_db_column(:check_out) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:users)}
    it { should belong_to(:trip)}
    it { should belong_to(:location)}
    it { should belong_to(:creator).class_name('User')}
  end
end
