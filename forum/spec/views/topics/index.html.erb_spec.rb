require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        :comment => "comment",
        :parent_id => 1,
        :level => 2
      ),
      Topic.create!(
        :comment => "comment",
        :parent_id => 1,
        :level => 2
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", :text => "comment".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
