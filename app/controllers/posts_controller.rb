class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.all.order(created_at: :desc)
    render json: posts, status: 200
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      render json: post, status: 201
    else
      render json: { errors: post.errors.full_messages }, status: 422
    end
  end

  private

    def post_params
      params.permit(:photo, :caption, :filter, :address, :lat, :lng)
    end
end
