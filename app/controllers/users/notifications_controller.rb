class Users::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    notifications = current_user.notifications.
                      order(created_at: :desc).
                      paginate(page: params[:page], per_page: 20)
    render json: notifications, meta: pagination_dict(notifications), status: 200
  end

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read_at: Time.zone.now)
    head 204
  end
end
