require 'rails_helper'

RSpec.describe "Locations", type: :request do
  describe "GET /index" do
    it "renders the index template" do
      get "/locations"
      expect(response).to be_successful
    end
  end
end
