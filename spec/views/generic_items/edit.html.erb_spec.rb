require 'spec_helper'

describe "generic_items/edit" do
  before(:each) do
    @generic_item = assign(:generic_item, stub_model(GenericItem,
      :title => "MyString",
      :subtitle => "MyString",
      :creator => "MyString"
    ))
  end

  it "renders the edit generic_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", generic_item_path(@generic_item), "post" do
      assert_select "input#generic_item_title[name=?]", "generic_item[title]"
      assert_select "input#generic_item_subtitle[name=?]", "generic_item[subtitle]"
      assert_select "input#generic_item_creator[name=?]", "generic_item[creator]"
    end
  end
end
