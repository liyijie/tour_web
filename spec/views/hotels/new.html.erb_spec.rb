require 'rails_helper'

RSpec.describe "hotels/new", :type => :view do
  before(:each) do
    assign(:hotel, Hotel.new())
  end

  it "renders new hotel form" do
    render

    assert_select "form[action=?][method=?]", hotels_path, "post" do
    end
  end
end
