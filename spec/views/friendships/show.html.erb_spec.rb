require 'spec_helper'

describe "friendships/show.html.erb" do
  before(:each) do
    @friendship = assign(:friendship, stub_model(Friendship,
      :user_id => 1,
      :friend_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
