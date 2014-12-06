require 'rails_helper'

RSpec.describe "pomotions/show", :type => :view do
  before(:each) do
    @pomotion = assign(:pomotion, Pomotion.create!(
      :title => "Title",
      :sub_title => "Sub Title",
      :content => "MyText",
      :rate => 1,
      :category => nil
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Title/)
  #   expect(rendered).to match(/Sub Title/)
  #   expect(rendered).to match(/MyText/)
  #   expect(rendered).to match(/1/)
  #   expect(rendered).to match(//)
  # end
end
