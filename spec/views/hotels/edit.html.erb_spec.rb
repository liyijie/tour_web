require 'rails_helper'

RSpec.describe "hotels/edit", :type => :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!())
  end

  it "renders the edit hotel form" do
    render

    assert_select "form[action=?][method=?]", hotel_path(@hotel), "post" do
    end
  end
end
