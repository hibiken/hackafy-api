class Users::FollowingController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    following = @user.following.paginate(page: params[:page], per_page: 10)
    render json: following, meta: pagination_dict(following), status: 200
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end
end
