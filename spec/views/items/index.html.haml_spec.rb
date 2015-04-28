require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :descripition => "Descripition",
        :url => "Url"
      ),
      Item.create!(
        :descripition => "Descripition",
        :url => "Url"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Descripition".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
