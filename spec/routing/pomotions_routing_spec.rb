require "rails_helper"

RSpec.describe PomotionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "categories/1/pomotions").to route_to("pomotions#index", category_id: "1")
    end

    # it "routes to #new" do
    #   expect(:get => "/pomotions/new").to route_to("pomotions#new")
    # end

    it "routes to #show" do
      expect(:get => "categories/1/pomotions/1").to route_to("pomotions#show", :id => "1", category_id: "1")
    end

    # it "routes to #edit" do
    #   expect(:get => "/pomotions/1/edit").to route_to("pomotions#edit", :id => "1")
    # end

    # it "routes to #create" do
    #   expect(:post => "/pomotions").to route_to("pomotions#create")
    # end

    # it "routes to #update" do
    #   expect(:put => "/pomotions/1").to route_to("pomotions#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   expect(:delete => "/pomotions/1").to route_to("pomotions#destroy", :id => "1")
    # end

  end
end
