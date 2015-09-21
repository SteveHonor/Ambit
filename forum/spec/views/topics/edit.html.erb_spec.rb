require 'rails_helper'

RSpec.describe "topics/edit", type: :view do
  before(:each) do
    @topic = assign(:topic, Topic.create!(
      :comment => "MyString",
      :parent_id => 1,
      :level => 1
    ))
  end

  it "renders the edit topic form" do
    render

    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do

      assert_select "input#topic_comment[name=?]", "topic[comment]"

      assert_select "input#topic_parent_id[name=?]", "topic[parent_id]"

      assert_select "input#topic_level[name=?]", "topic[level]"
    end
  end
end
