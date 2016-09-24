require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:password) }
  end
end
