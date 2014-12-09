require "rails_helper"

RSpec.describe HotelsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hotels").to route_to("hotels#index")
    end

    it "routes to #new" do
      expect(:get => "/hotels/new").to route_to("hotels#new")
    end

    it "routes to #show" do
      expect(:get => "/hotels/1").to route_to("hotels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hotels/1/edit").to route_to("hotels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hotels").to route_to("hotels#create")
    end

    it "routes to #update" do
      expect(:put => "/hotels/1").to route_to("hotels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hotels/1").to route_to("hotels#destroy", :id => "1")
    end

  end
end
