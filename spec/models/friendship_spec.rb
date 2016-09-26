require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "attributes" do
     it { should have_db_column(:user_id) }
     it { should have_db_column(:friend_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end
end

