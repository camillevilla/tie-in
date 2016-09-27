require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "attributes" do
    it {should have_db_column(:name) }
    it {should have_db_column(:street_address_1) }
    it {should have_db_column(:street_address_2) }
    it {should have_db_column(:city) }
    it {should have_db_column(:state) }
    it {should have_db_column(:zipcode) }
  end

  describe "associations" do
    it { should have_many(:accommodations) }
    it { should have_many(:events) }
  end
end
