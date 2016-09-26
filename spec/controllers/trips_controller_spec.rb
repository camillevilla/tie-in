require 'rails_helper'

RSpec.describe TripsController, type: :controller do

  describe "GET #index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    xit "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
