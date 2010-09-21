require 'spec_helper'

describe User do
  it "should add life quest on user creation" do
    user = Factory(:user)
    user.quests.first.title.should == DEFAULT_QUEST["title"]
  end
  it "should be able to receive notifications" do
    user = Factory(:user)
    message = "You have a new notification"
    user.send_notification(message)
    user.notifications.last.message.should == message
  end
  it "should be able to show unread notifications" do
    user = Factory(:user)
    notification1 = Factory(:notification, :user => user)
    
    notification2 = Factory(:notification, :user => user)
    notification2.read = true
    notification2.save
    
    user.unread_notifications.count.should == 1
  end
end
