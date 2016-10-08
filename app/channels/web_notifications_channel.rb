# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    binding.pry
    #stream_from "notifications"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
