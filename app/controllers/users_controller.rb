class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(user_params)
      render json: current_user, serializer: CurrentUserSerializer, status: 200
    else
      render json: { errors: current_user.errors.full_messages }, status: 422
    end
  end

  private

    def user_params
      params.permit(:avatar, :username, :email)
    end
end
