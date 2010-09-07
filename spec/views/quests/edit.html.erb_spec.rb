require 'spec_helper'

describe "quests/edit.html.erb" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :new_record? => false,
      :title => "MyString",
      :description => "MyText",
      :quest_master => 1,
      :distance => 1.5
    ))
  end

  it "renders the edit quest form" do
    render

    rendered.should have_selector("form", :action => quest_path(@quest), :method => "post") do |form|
      form.should have_selector("input#quest_title", :name => "quest[title]")
      form.should have_selector("textarea#quest_description", :name => "quest[description]")
      form.should have_selector("input#quest_quest_master", :name => "quest[quest_master]")
      form.should have_selector("input#quest_distance", :name => "quest[distance]")
    end
  end
end
