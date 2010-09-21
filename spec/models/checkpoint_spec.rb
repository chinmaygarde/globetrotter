require 'spec_helper'

describe Checkpoint do
  it "should get address after creation of new checkpoint" do
    checkpoint = Factory(:checkpoint)
    checkpoint.address.should_not be_nil
  end
  #it "should create a new journey when 2 or more checkpoints are present" do
  #  
  #end
end
