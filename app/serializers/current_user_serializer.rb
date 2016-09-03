class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :authentication_token,
             :attrs, :post_ids, :liked_post_ids, :following_ids, :follower_ids

  has_many :posts

  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end

  def attrs
    {
      email: object.email,
      username: object.username,
      avatar_url: object.avatar_url
    }
  end

end
