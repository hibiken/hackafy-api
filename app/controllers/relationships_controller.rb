class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    if current_user.follow(@user)
      Notification.create!(actor: current_user, recipient: @user, notifiable: @user, action_type: 'START_FOLLOWING')
      render json: @user, status: 200
    else
      render json: { errors: ['Could not follow user'] }, status: 422
    end
  end

  def destroy
    if current_user.unfollow(@user)
      render json: @user, status: 200
    else
      render json: { errors: ['Could not unfollow user'] }, status: 422
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end
end
