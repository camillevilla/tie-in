require 'rails_helper'

RSpec.describe EventInvitation, type: :model do
  describe "attributes" do
    it { should have_db_column(:sender_id) }
    it { should have_db_column(:recipient_id) }
    it { should have_db_column(:event_id) }
    it { should have_db_column(:accepted) }
  end
end
