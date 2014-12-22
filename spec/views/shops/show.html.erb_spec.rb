require 'rails_helper'

RSpec.describe "shops/show", :type => :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      :name => "Name",
      :addr => "Addr",
      :tel => "Tel",
      :special => "MyText",
      :work_range => "Work Range",
      :price_avg => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Addr/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Work Range/)
    expect(rendered).to match(/1.5/)
  end
end
