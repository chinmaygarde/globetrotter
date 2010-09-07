require 'spec_helper'

describe "quests/index.html.erb" do
  before(:each) do
    assign(:quests, [
      stub_model(Quest,
        :title => "Title",
        :description => "MyText",
        :quest_master => 1,
        :distance => 1.5
      ),
      stub_model(Quest,
        :title => "Title",
        :description => "MyText",
        :quest_master => 1,
        :distance => 1.5
      )
    ])
  end

  it "renders a list of quests" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
  end
end
