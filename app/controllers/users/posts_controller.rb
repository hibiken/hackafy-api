class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    if @user.present?
      render json: @user.posts.order(created_at: :desc), status: 200
    else
      render json: { errors: ["User not found"] }, status: 422
    end
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end
end
