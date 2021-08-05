require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        name: "Name",
        image: "Image"
      ),
      Topic.create!(
        name: "Name",
        image: "Image"
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
  end
end
