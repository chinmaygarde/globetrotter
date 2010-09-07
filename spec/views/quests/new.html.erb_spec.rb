require 'spec_helper'

describe "quests/new.html.erb" do
  before(:each) do
    assign(:quest, stub_model(Quest,
      :new_record? => true,
      :title => "MyString",
      :description => "MyText",
      :quest_master => 1,
      :distance => 1.5
    ))
  end

  it "renders new quest form" do
    render

    rendered.should have_selector("form", :action => quests_path, :method => "post") do |form|
      form.should have_selector("input#quest_title", :name => "quest[title]")
      form.should have_selector("textarea#quest_description", :name => "quest[description]")
      form.should have_selector("input#quest_quest_master", :name => "quest[quest_master]")
      form.should have_selector("input#quest_distance", :name => "quest[distance]")
    end
  end
end
