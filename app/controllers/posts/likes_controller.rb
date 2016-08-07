class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    current_user.like!(@post)
    head 204
  end

  def destroy
    current_user.dislike!(@post)
    head 204
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end
end
