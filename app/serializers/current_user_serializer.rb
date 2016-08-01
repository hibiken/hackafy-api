class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :authentication_token

  def authentication_token
    JsonWebToken.encode({ user_id: object.id })
  end
end
