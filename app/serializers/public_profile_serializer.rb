class PublicProfileSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :avatar_url, :username, :followers_count,
             :following_count

  def avatar_url
    object.avatar_url
  end

  def followers_count
    object.followers.count
  end

  def following_count
    object.following.count
  end
end
