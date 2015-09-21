require 'rails_helper'

RSpec.describe "topics/show", type: :view do
  before(:each) do
    @topic = assign(:topic, Topic.create!(
      :comment => "comment",
      :parent_id => 1,
      :level => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/comment/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
