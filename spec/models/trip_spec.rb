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
end
