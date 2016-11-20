class Users::FollowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    followers = @user.followers.paginate(page: params[:page], per_page: 10)
    render json: followers, meta: pagination_dict(followers), status: 200
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end
end
