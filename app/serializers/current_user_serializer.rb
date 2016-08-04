class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :authentication_token,
             :post_ids, :attrs

  has_many :posts

  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end

  def attrs
    {
      email: object.email,
      username: object.username,
      avatar_url: object.avatar.url
    }
  end

end
