require 'rails_helper'

RSpec.describe "tours/edit", :type => :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!(
      :title => "MyString",
      :sub_title => "MyString",
      :addr => "MyString",
      :price => 1.5,
      :work_range => "MyString",
      :hint => "MyText",
      :desc => "MyText",
      :traffic => "MyText",
      :seq => "MyString",
      :position => 1,
      :lon => 1.5,
      :lat => 1.5,
      :city => nil
    ))
  end

  it "renders the edit tour form" do
    render

    assert_select "form[action=?][method=?]", tour_path(@tour), "post" do

      assert_select "input#tour_title[name=?]", "tour[title]"

      assert_select "input#tour_sub_title[name=?]", "tour[sub_title]"

      assert_select "input#tour_addr[name=?]", "tour[addr]"

      assert_select "input#tour_price[name=?]", "tour[price]"

      assert_select "input#tour_work_range[name=?]", "tour[work_range]"

      assert_select "textarea#tour_hint[name=?]", "tour[hint]"

      assert_select "textarea#tour_desc[name=?]", "tour[desc]"

      assert_select "textarea#tour_traffic[name=?]", "tour[traffic]"

      assert_select "input#tour_seq[name=?]", "tour[seq]"

      assert_select "input#tour_position[name=?]", "tour[position]"

      assert_select "input#tour_lon[name=?]", "tour[lon]"

      assert_select "input#tour_lat[name=?]", "tour[lat]"

      assert_select "input#tour_city_id[name=?]", "tour[city_id]"
    end
  end
end
