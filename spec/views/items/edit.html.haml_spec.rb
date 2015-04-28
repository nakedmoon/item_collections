require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :descripition => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_descripition[name=?]", "item[descripition]"

      assert_select "input#item_url[name=?]", "item[url]"
    end
  end
end
