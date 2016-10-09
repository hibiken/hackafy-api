class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :actor, :action_type, :read_at, :notifiable_id, :notifiable_type,
             :photoUrl, :metadata

  def actor
    {
      'username' => object.actor.username,
      'id' => object.actor_id,
      'avatarUrl' => object.actor.avatar_url
    }
  end

  def photoUrl
    if object.notifiable_type == 'Post'
      object.notifiable.photo.url
    end
  end

  def metadata
    case object.action_type
    when 'LIKE_POST'
      like_post_meatadata
    end
  end

  private
    def like_post_meatadata
      {
        'likesCount' => object.notifiable.reload.likes_count
      }
    end
end
