require 'rails_helper'

RSpec.describe "hotels/edit", :type => :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!(
      :name => "MyString",
      :addr => "MyString",
      :tel => "MyString",
      :desc => "MyText",
      :traffic => "MyText",
      :city => nil
    ))
  end

  it "renders the edit hotel form" do
    render

    assert_select "form[action=?][method=?]", hotel_path(@hotel), "post" do

      assert_select "input#hotel_name[name=?]", "hotel[name]"

      assert_select "input#hotel_addr[name=?]", "hotel[addr]"

      assert_select "input#hotel_tel[name=?]", "hotel[tel]"

      assert_select "textarea#hotel_desc[name=?]", "hotel[desc]"

      assert_select "textarea#hotel_traffic[name=?]", "hotel[traffic]"

      assert_select "input#hotel_city_id[name=?]", "hotel[city_id]"
    end
  end
end
