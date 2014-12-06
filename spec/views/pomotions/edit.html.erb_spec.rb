require 'rails_helper'

RSpec.describe "pomotions/edit", :type => :view do
  before(:each) do
    @pomotion = assign(:pomotion, Pomotion.create!(
      :title => "MyString",
      :sub_title => "MyString",
      :content => "MyText",
      :rate => 1,
      :category => nil
    ))
  end

  it "renders the edit pomotion form" do
    render

    assert_select "form[action=?][method=?]", pomotion_path(@pomotion), "post" do

      assert_select "input#pomotion_title[name=?]", "pomotion[title]"

      assert_select "input#pomotion_sub_title[name=?]", "pomotion[sub_title]"

      assert_select "textarea#pomotion_content[name=?]", "pomotion[content]"

      assert_select "input#pomotion_rate[name=?]", "pomotion[rate]"

      assert_select "input#pomotion_category_id[name=?]", "pomotion[category_id]"
    end
  end
end
