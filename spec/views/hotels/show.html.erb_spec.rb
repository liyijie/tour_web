require 'rails_helper'

RSpec.describe "hotels/show", :type => :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
