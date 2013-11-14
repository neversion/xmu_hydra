require 'spec_helper'

describe "generic_items/index" do
  before(:each) do
    assign(:generic_items, [
      stub_model(GenericItem,
        :title => "Title",
        :subtitle => "Subtitle",
        :creator => "Creator"
      ),
      stub_model(GenericItem,
        :title => "Title",
        :subtitle => "Subtitle",
        :creator => "Creator"
      )
    ])
  end

  it "renders a list of generic_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
  end
end
