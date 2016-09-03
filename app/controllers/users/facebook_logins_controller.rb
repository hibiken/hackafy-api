class Users::FacebookLoginsController < ApplicationController
  def create
    # TODO: find by either facebook_id OR email
    @user = User.find_by(facebook_id: params[:facebook_id])
    if @user
      render json: @user, serializer: CurrentUserSerializer, status: 200
    else
      # TODO: create unique username
      @new_user = User.create!(user_params)
      render json: @new_user, serializer: CurrentUserSerializer, status: 201
    end
  end

  private

    def user_params
      # TODO: generate random password
      params.permit(:facebook_id, :username).merge(password: 'password')
    end
end
