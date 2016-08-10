class Users::PublicProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find_by(username: params[:username])
    if user.present?
      render json: user, serializer: PublicProfileSerializer, status: 200
    else
      render json: { errors: ["User not found"] }, status: 422
    end
  end
end
