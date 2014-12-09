require 'rails_helper'

RSpec.describe "hotels/show", :type => :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!(
      :name => "Name",
      :addr => "Addr",
      :tel => "Tel",
      :desc => "MyText",
      :traffic => "MyText",
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Addr/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
