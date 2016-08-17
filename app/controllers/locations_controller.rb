class LocationsController < ApplicationController
  before_action :authenticate_user!

  def show
    posts = Post.where(place_id: params[:id]).order(created_at: :desc)
    render json: posts,status: 200
  end
end
