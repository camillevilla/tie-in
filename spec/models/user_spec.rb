require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:password) }
  end

  describe "associations" do
    it {should have_many(:created_trips).with_foreign_key('creator_id').class_name('Trip')}
    it {should have_and_belong_to_many(:trips)}
    it {should have_many(:created_events).with_foreign_key('creator_id').class_name('Event')}
    it {should have_many(:sent_invitations).with_foreign_key('sender_id').class_name('EventInvitation')}
    it {should have_many(:received_invitations).with_foreign_key('recipient_id').class_name('EventInvitation')}

  end
end
