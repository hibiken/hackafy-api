class Users::NotificationCountsController < ApplicationController
  before_action :authenticate_user!

  def show
    notification_count = current_user.notifications.pristine.count
    render json: { count: notification_count }, status: 200
  end

  def destroy
    current_user.notifications.update_all(pristine: false)
    head 204
  end
end
