require 'spec_helper'

describe "quests/show.html.erb" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :title => "Title",
      :description => "MyText",
      :quest_master => 1,
      :distance => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.5.to_s)
  end
end
