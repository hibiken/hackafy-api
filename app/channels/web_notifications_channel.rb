# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications_#{current_user.id.to_s}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
