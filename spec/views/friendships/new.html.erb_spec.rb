require 'spec_helper'

describe "friendships/new.html.erb" do
  before(:each) do
    assign(:friendship, stub_model(Friendship,
      :new_record? => true,
      :user_id => 1,
      :friend_id => 1
    ))
  end

  it "renders new friendship form" do
    render

    rendered.should have_selector("form", :action => friendships_path, :method => "post") do |form|
      form.should have_selector("input#friendship_user_id", :name => "friendship[user_id]")
      form.should have_selector("input#friendship_friend_id", :name => "friendship[friend_id]")
    end
  end
end
