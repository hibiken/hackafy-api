class Users::FacebookLoginsController < ApplicationController
  def create
    # TODO: find by either facebook_id OR email
    @user = User.find_by(facebook_id: params[:facebook_id]) if params[:facebook_id].present?
    if @user
      render json: @user, serializer: CurrentUserSerializer, status: 200
    else
      @user = User.create!(user_params)
      render json: @user, serializer: CurrentUserSerializer, status: 201
    end
  end

  private

    def user_params
      # TODO: create unique username
      # TODO: generate random password
      params.permit(:facebook_id, :username).merge(password: 'password')
    end
end
