class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.get_page(params[:page])
    render json: posts, meta: pagination_dict(posts), status: 200
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
      params.permit(:photo, :caption, :filter, :address, :lat, :lng, :place_id)
    end
end
