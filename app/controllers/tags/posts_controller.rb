class Tags::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag

  def index
    if @tag.present?
      posts = @tag.posts.get_page(params[:page], 9)
      render json: posts, meta: pagination_dict(posts), status: 200
    else
      render json: { errors: ["Tag #{params[:tag_name]} not found"] }, status: 422
    end
  end

  private

    def set_tag
      @tag = Tag.find_by(name: params[:tag_name])
    end
end
