require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TourOrdersController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # TourOrder. As you add validations to TourOrder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TourOrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tour_orders as @tour_orders" do
      tour_order = TourOrder.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tour_orders)).to eq([tour_order])
    end
  end

  describe "GET show" do
    it "assigns the requested tour_order as @tour_order" do
      tour_order = TourOrder.create! valid_attributes
      get :show, {:id => tour_order.to_param}, valid_session
      expect(assigns(:tour_order)).to eq(tour_order)
    end
  end

  describe "GET new" do
    it "assigns a new tour_order as @tour_order" do
      get :new, {}, valid_session
      expect(assigns(:tour_order)).to be_a_new(TourOrder)
    end
  end

  describe "GET edit" do
    it "assigns the requested tour_order as @tour_order" do
      tour_order = TourOrder.create! valid_attributes
      get :edit, {:id => tour_order.to_param}, valid_session
      expect(assigns(:tour_order)).to eq(tour_order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TourOrder" do
        expect {
          post :create, {:tour_order => valid_attributes}, valid_session
        }.to change(TourOrder, :count).by(1)
      end

      it "assigns a newly created tour_order as @tour_order" do
        post :create, {:tour_order => valid_attributes}, valid_session
        expect(assigns(:tour_order)).to be_a(TourOrder)
        expect(assigns(:tour_order)).to be_persisted
      end

      it "redirects to the created tour_order" do
        post :create, {:tour_order => valid_attributes}, valid_session
        expect(response).to redirect_to(TourOrder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tour_order as @tour_order" do
        post :create, {:tour_order => invalid_attributes}, valid_session
        expect(assigns(:tour_order)).to be_a_new(TourOrder)
      end

      it "re-renders the 'new' template" do
        post :create, {:tour_order => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tour_order" do
        tour_order = TourOrder.create! valid_attributes
        put :update, {:id => tour_order.to_param, :tour_order => new_attributes}, valid_session
        tour_order.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested tour_order as @tour_order" do
        tour_order = TourOrder.create! valid_attributes
        put :update, {:id => tour_order.to_param, :tour_order => valid_attributes}, valid_session
        expect(assigns(:tour_order)).to eq(tour_order)
      end

      it "redirects to the tour_order" do
        tour_order = TourOrder.create! valid_attributes
        put :update, {:id => tour_order.to_param, :tour_order => valid_attributes}, valid_session
        expect(response).to redirect_to(tour_order)
      end
    end

    describe "with invalid params" do
      it "assigns the tour_order as @tour_order" do
        tour_order = TourOrder.create! valid_attributes
        put :update, {:id => tour_order.to_param, :tour_order => invalid_attributes}, valid_session
        expect(assigns(:tour_order)).to eq(tour_order)
      end

      it "re-renders the 'edit' template" do
        tour_order = TourOrder.create! valid_attributes
        put :update, {:id => tour_order.to_param, :tour_order => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tour_order" do
      tour_order = TourOrder.create! valid_attributes
      expect {
        delete :destroy, {:id => tour_order.to_param}, valid_session
      }.to change(TourOrder, :count).by(-1)
    end

    it "redirects to the tour_orders list" do
      tour_order = TourOrder.create! valid_attributes
      delete :destroy, {:id => tour_order.to_param}, valid_session
      expect(response).to redirect_to(tour_orders_url)
    end
  end

end
