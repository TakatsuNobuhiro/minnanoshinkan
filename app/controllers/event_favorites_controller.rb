class EventFavoritesController < ApplicationController
  before_action :authenticate_student!
  def create
    @event = Event.find(params[:event_id])
    current_student.event_favorite(@event)
    event_count(@event)
    @event.create_notification_by(current_student)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
    


  def destroy
    @event = Event.find(params[:event_id])
    current_student.event_unfavorite(@event)
    event_count(@event)
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
