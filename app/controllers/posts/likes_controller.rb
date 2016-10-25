class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    current_user.like!(@post)
    create_notification
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

    def create_notification
      unless current_user.id == @post.user.id
        notification = Notification.create!(actor: current_user, recipient: @post.user,
                             notifiable: @post, action_type: 'LIKE_POST')
        Notification::Broadcaster.new(notification, to: @post.user).broadcast
      end
    end
end
