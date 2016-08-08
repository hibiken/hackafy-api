class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :user_id, :username

  def username
    object.user.username
  end
end
