require 'rails_helper'

RSpec.describe FriendsController, type: :controller do

  describe "GET #index" do
    # disabled until nested routes are established
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
