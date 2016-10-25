class Notification::Broadcaster
  def initialize(notification, to:)
    @notification = notification
    @receiver = to
  end

  def broadcast
    ActionCable.server.broadcast(
      "web_notifications_#{@receiver.id}",
      serializable_notification
    )
  end

  private

  attr_reader :notification, :receiver

  def serializable_notification
    ActiveModelSerializers::SerializableResource.new(notification)
  end
end
