class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = Post.get_page(params[:page])
    render json: posts, meta: pagination_dict(posts), status: 200
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      create_tags
      render json: @post, status: 201
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  private

    def post_params
      params.permit(:photo, :caption, :filter, :address, :lat, :lng, :place_id, :filter_style)
    end

    # TODO: should this be capsulated in Post#save method?
    def create_tags
      @post.tags = @post.caption.scan(/#\w+/).map do |name| 
        Tag.where(name: name[1..-1]).first_or_initialize
      end
    end
end
