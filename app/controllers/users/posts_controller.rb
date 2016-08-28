class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    if @user.present?
      posts = @user.posts.get_page(params[:page], 9)
      render json: posts, meta: pagination_dict(posts), status: 200
    else
      render json: { errors: ["User not found"] }, status: 422
    end
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end
end
