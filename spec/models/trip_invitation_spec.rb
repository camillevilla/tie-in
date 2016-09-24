require 'rails_helper'

RSpec.describe TripInvitation, type: :model do
  describe "attributes" do
    it { should have_db_column(:sender_id) }
    it { should have_db_column(:recipient_id) }
    it { should have_db_column(:trip_id) }
    it { should have_db_column(:accepted) }
  end

  describe "associations" do
    it {should belong_to(:trip)}
    it {should belong_to(:sender).class_name('User')}
    it {should belong_to(:recipient).class_name('User')}
  end
end
