require 'spec_helper'

describe "user_sessions/index.html.erb" do
  before(:each) do
    assign(:user_sessions, [
      stub_model(UserSession,
        :username => "Username",
        :password => "Password"
      ),
      stub_model(UserSession,
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of user_sessions" do
    render
    rendered.should have_selector("tr>td", :content => "Username".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Password".to_s, :count => 2)
  end
end
