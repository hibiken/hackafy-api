class PostSerializer < ActiveModel::Serializer
  attributes :id, :photo_url, :filter, :caption, :created_at, :user_id

  belongs_to :user, serializer: UserSimpleSerializer

  def photo_url
    object.photo.url
  end
end
