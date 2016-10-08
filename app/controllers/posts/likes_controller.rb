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

        serializable_resource = ActiveModelSerializers::SerializableResource.new(notification, {})
        ActionCable.server.broadcast(
          "web_notifications_#{@post.user.username}",
          json: serializable_resource.to_json
        )
      end
    end
end
