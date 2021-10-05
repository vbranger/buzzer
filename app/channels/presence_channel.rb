class PresenceChannel < ApplicationCable::Channel
  def subscribed
    p "in presence channel subscribed"
    stream_from "presence_channel_#{params[:id]}"
    # current_user.active_user = true
    # current_user.save

    ActionCable.server.broadcast("presence_channel_#{params[:id]}", {type: "CO_USER", user: current_user.id})
  end

  def unsubscribed
    p "in unsubscribed from presence channel"
    
    ActionCable.server.broadcast("presence_channel_#{params[:id]}", {type: "DC_USER", user: current_user.id})
  end
end
