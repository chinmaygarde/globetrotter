require 'spec_helper'

describe "user_sessions/edit.html.erb" do
  before(:each) do
    @user_session = assign(:user_session, stub_model(UserSession,
      :new_record? => false,
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit user_session form" do
    render

    rendered.should have_selector("form", :action => user_session_path(@user_session), :method => "post") do |form|
      form.should have_selector("input#user_session_username", :name => "user_session[username]")
      form.should have_selector("input#user_session_password", :name => "user_session[password]")
    end
  end
end
