require 'rails_helper'

RSpec.describe "pomotions/index", :type => :view do
  before(:each) do
    assign(:pomotions, [
      Pomotion.create!(
        :title => "Title",
        :sub_title => "Sub Title",
        :content => "MyText",
        :rate => 1,
        :category => nil
      ),
      Pomotion.create!(
        :title => "Title",
        :sub_title => "Sub Title",
        :content => "MyText",
        :rate => 1,
        :category => nil
      )
    ])
  end

  it "renders a list of pomotions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sub Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
