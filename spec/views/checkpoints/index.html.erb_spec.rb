require 'spec_helper'

describe "checkpoints/index.html.erb" do
  before(:each) do
    assign(:checkpoints, [
      stub_model(Checkpoint,
        :latitude => 1.5,
        :longitude => 1.5,
        :user_id => 1
      ),
      stub_model(Checkpoint,
        :latitude => 1.5,
        :longitude => 1.5,
        :user_id => 1
      )
    ])
  end

  it "renders a list of checkpoints" do
    render
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
