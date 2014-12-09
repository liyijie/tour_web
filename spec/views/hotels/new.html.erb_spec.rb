require 'rails_helper'

RSpec.describe "hotels/new", :type => :view do
  before(:each) do
    assign(:hotel, Hotel.new(
      :name => "MyString",
      :addr => "MyString",
      :tel => "MyString",
      :desc => "MyText",
      :traffic => "MyText",
      :city => nil
    ))
  end

  it "renders new hotel form" do
    render

    assert_select "form[action=?][method=?]", hotels_path, "post" do

      assert_select "input#hotel_name[name=?]", "hotel[name]"

      assert_select "input#hotel_addr[name=?]", "hotel[addr]"

      assert_select "input#hotel_tel[name=?]", "hotel[tel]"

      assert_select "textarea#hotel_desc[name=?]", "hotel[desc]"

      assert_select "textarea#hotel_traffic[name=?]", "hotel[traffic]"

      assert_select "input#hotel_city_id[name=?]", "hotel[city_id]"
    end
  end
end
