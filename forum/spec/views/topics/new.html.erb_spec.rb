require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:topic, Topic.new(
      :comment => "MyString",
      :parent_id => 1,
      :level => 1
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input#topic_comment[name=?]", "topic[comment]"

      assert_select "input#topic_parent_id[name=?]", "topic[parent_id]"

      assert_select "input#topic_level[name=?]", "topic[level]"
    end
  end
end
