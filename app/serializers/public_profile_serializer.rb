class PublicProfileSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :avatar_url, :username

  def avatar_url
    object.avatar.url
  end
end
