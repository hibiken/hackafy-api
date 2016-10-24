class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.get_page(params[:page])
    render json: posts, meta: pagination_dict(posts), status: 200
  end

  def create
    post = current_user.posts.build(post_params)
    post_builder = Post::Create.new(post)
    if post_builder.run
      render json: post_builder.post, status: 201
    else
      render json: { errors: post_builder.post.errors.full_messages }, status: 422
    end
  end

  private

    def post_params
      params.permit(:photo, :caption, :filter, :address, :lat, :lng, :place_id, :filter_style)
    end
end
