class Users::FollowingController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    following = @user.following
    render json: following, status: 200
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end
end
