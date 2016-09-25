require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "attributes" do
    it { should have_db_column(:creator_id) }
    it { should have_db_column(:name) }
    it { should have_db_column(:description) }
    it { should have_db_column(:start_date) }
    it { should have_db_column(:end_date) }
    it { should have_db_column(:location) }
  end

  describe "associations" do
    it {should belong_to(:creator).class_name('User')}
    it {should have_and_belong_to_many(:users)}
    it {should have_many(:trip_invitations)}
    it {should have_many(:events)}
    it {should have_many(:accommodations)}
    it {should have_many(:transits)}
  end
end
