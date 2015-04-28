require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :descripition => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_descripition[name=?]", "item[descripition]"

      assert_select "input#item_url[name=?]", "item[url]"
    end
  end
end
