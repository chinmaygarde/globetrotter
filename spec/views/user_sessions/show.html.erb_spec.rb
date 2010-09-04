require 'spec_helper'

describe "user_sessions/show.html.erb" do
  before(:each) do
    @user_session = assign(:user_session, stub_model(UserSession,
      :username => "Username",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Username".to_s)
    rendered.should contain("Password".to_s)
  end
end
