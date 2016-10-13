class FollowSuggestionSerializer < ActiveModel::Serializer
  attributes :id, :username, :posts, :avatar_url
  has_many :posts

  def posts
    object.posts.order(created_at: :desc).first(3)
  end
end
