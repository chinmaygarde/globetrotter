class NotificationsController < ApplicationController
  def index
    @notifications = User.find(params[:user_id]).unread_notifications
    @notifications.each do |notification|
      notification.read = true
      notification.save
    end
  end
end