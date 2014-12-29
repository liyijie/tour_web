require 'rails_helper'

RSpec.describe "hotels/index", :type => :view do
  before(:each) do
    assign(:hotels, [
      Hotel.create!(),
      Hotel.create!()
    ])
  end

  it "renders a list of hotels" do
    render
  end
end
