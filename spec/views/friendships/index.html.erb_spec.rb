require 'spec_helper'

describe "friendships/index.html.erb" do
  before(:each) do
    assign(:friendships, [
      stub_model(Friendship,
        :user_id => 1,
        :friend_id => 1
      ),
      stub_model(Friendship,
        :user_id => 1,
        :friend_id => 1
      )
    ])
  end

  it "renders a list of friendships" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
