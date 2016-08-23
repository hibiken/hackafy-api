class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :actor, :action_type, :read_at, :notifiable_id, :notifiable_type,
             :photoUrl

  def actor
    { 
      'username' => object.actor.username, 
      'id' => object.actor_id,
      'avatarUrl' => object.actor.avatar.url
    }
  end

  def photoUrl
    if object.notifiable_type == 'Post'
      object.notifiable.photo.url
    end
  end
end
