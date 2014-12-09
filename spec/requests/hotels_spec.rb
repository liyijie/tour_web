require 'rails_helper'

RSpec.describe "Hotels", :type => :request do
  describe "GET /hotels" do
    it "works! (now write some real specs)" do
      get hotels_path
      expect(response).to have_http_status(200)
    end
  end
end
