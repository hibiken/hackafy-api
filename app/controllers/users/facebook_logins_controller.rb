class Users::FacebookLoginsController < ApplicationController
  def create
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
      username = generate_unique_username
      params.permit(:facebook_id).merge(username: username)
    end

    def generate_unique_username
      name = params[:username].split.join('-').downcase
      loop do
        username = "#{name}#{SecureRandom.random_number(1000..9999).to_s}"
        break username unless User.exists?(username: username)
      end
    end
end
