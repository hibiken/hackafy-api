class Users::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    notifications = current_user.notifications
    render json: notifications, status: 200
  end
end
