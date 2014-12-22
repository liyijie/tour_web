require 'rails_helper'

RSpec.describe "shops/new", :type => :view do
  before(:each) do
    assign(:shop, Shop.new(
      :name => "MyString",
      :addr => "MyString",
      :tel => "MyString",
      :special => "MyText",
      :work_range => "MyString",
      :price_avg => 1.5
    ))
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_addr[name=?]", "shop[addr]"

      assert_select "input#shop_tel[name=?]", "shop[tel]"

      assert_select "textarea#shop_special[name=?]", "shop[special]"

      assert_select "input#shop_work_range[name=?]", "shop[work_range]"

      assert_select "input#shop_price_avg[name=?]", "shop[price_avg]"
    end
  end
end
