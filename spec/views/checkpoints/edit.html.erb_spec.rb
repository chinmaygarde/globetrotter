require 'spec_helper'

describe "checkpoints/edit.html.erb" do
  before(:each) do
    @checkpoint = assign(:checkpoint, stub_model(Checkpoint,
      :new_record? => false,
      :latitude => 1.5,
      :longitude => 1.5,
      :user_id => 1
    ))
  end

  it "renders the edit checkpoint form" do
    render

    rendered.should have_selector("form", :action => checkpoint_path(@checkpoint), :method => "post") do |form|
      form.should have_selector("input#checkpoint_latitude", :name => "checkpoint[latitude]")
      form.should have_selector("input#checkpoint_longitude", :name => "checkpoint[longitude]")
      form.should have_selector("input#checkpoint_user_id", :name => "checkpoint[user_id]")
    end
  end
end
