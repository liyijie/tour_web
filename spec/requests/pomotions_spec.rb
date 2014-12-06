require 'rails_helper'

RSpec.describe "Pomotions", :type => :request do
  describe "GET /pomotions" do
    it "works! (now write some real specs)" do
      get pomotions_path
      expect(response.status).to be(200)
    end
  end
end
