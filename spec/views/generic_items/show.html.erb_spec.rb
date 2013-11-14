require 'spec_helper'

describe "generic_items/show" do
  before(:each) do
    @generic_item = assign(:generic_item, stub_model(GenericItem,
      :title => "Title",
      :subtitle => "Subtitle",
      :creator => "Creator"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Subtitle/)
    rendered.should match(/Creator/)
  end
end
