class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def index
    comments = @post.comments.latest.paginate(page: params[:page])
    render json: comments, meta: pagination_dict(comments), status: 200
  end

  def create
    comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if comment.save
      create_notification
      render json: comment, status: 201
    else
      render json: { errors: comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    head 204
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.permit(:body)
    end

    def create_notification
      unless current_user.id == @post.user.id
        notification = Notification.create!(actor: current_user, recipient: @post.user,
                             notifiable: @post, action_type: 'COMMENT_ON_POST')
        Notification::Broadcaster.new(notification, to: @post.user).broadcast
      end
    end
end
