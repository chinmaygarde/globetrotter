require 'spec_helper'

describe "checkpoints/show.html.erb" do
  before(:each) do
    @checkpoint = assign(:checkpoint, stub_model(Checkpoint,
      :latitude => 1.5,
      :longitude => 1.5,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.to_s)
  end
end
