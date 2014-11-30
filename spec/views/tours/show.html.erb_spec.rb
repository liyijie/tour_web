require 'rails_helper'

RSpec.describe "tours/show", :type => :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!(
      :title => "Title",
      :sub_title => "Sub Title",
      :addr => "Addr",
      :price => 1.5,
      :work_range => "Work Range",
      :hint => "MyText",
      :desc => "MyText",
      :traffic => "MyText",
      :seq => "Seq",
      :position => 1,
      :lon => 1.5,
      :lat => 1.5,
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Sub Title/)
    expect(rendered).to match(/Addr/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Work Range/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Seq/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
