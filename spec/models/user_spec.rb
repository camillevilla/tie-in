require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
  end

  describe "associations" do
    describe "trips" do
        it { should have_and_belong_to_many(:trips) }
        it { should have_many(:created_trips).with_foreign_key('creator_id').class_name('Trip') }
        it { should have_many(:sent_trip_invitations).with_foreign_key('sender_id').class_name('TripInvitation') }
        it { should have_many(:received_trip_invitations).with_foreign_key('recipient_id').class_name('TripInvitation') }
    end

    describe "accommodations" do
        it { should have_and_belong_to_many(:accommodations) }
        it { should have_many(:created_accommodations).with_foreign_key('creator_id').class_name('Accommodation') }
    end

    describe "transits" do
        it { should have_and_belong_to_many(:transits) }
        it { should have_many(:created_transits).with_foreign_key('creator_id').class_name('Transit') }
    end

    describe "events" do
        it { should have_many(:created_events).with_foreign_key('creator_id').class_name('Event') }
        it { should have_many(:sent_event_invitations).with_foreign_key('sender_id').class_name('EventInvitation') }
        it { should have_many(:received_event_invitations).with_foreign_key('recipient_id').class_name('EventInvitation') }
    end

    describe "friends" do
        it { should have_many(:friendships) }
        it { should have_many(:friends).through(:friendships) }
        it { should have_many(:inverse_friendships).class_name('Friendship').with_foreign_key('friend_id') }
        it { should have_many(:inverse_friends).through(:inverse_friendships).source(:user) }
    end

  end

end
