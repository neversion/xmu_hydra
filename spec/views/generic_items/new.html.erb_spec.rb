require 'spec_helper'

describe "generic_items/new" do
  before(:each) do
    assign(:generic_item, stub_model(GenericItem,
      :title => "MyString",
      :subtitle => "MyString",
      :creator => "MyString"
    ).as_new_record)
  end

  it "renders new generic_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", generic_items_path, "post" do
      assert_select "input#generic_item_title[name=?]", "generic_item[title]"
      assert_select "input#generic_item_subtitle[name=?]", "generic_item[subtitle]"
      assert_select "input#generic_item_creator[name=?]", "generic_item[creator]"
    end
  end
end
