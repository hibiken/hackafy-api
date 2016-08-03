class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :authentication_token,
             :avatar_url, :post_ids

  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end

  def avatar_url
    object.avatar.url
  end
end
