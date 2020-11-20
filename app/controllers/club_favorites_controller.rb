class ClubFavoritesController < ApplicationController
  before_action :authenticate_student!
  def create
    @club = Club.find(params[:club_id])
    current_student.club_favorite(@club)
    club_count(@club)
    @club.create_notification_like!(current_student)
    respond_to do |format|
      format.html { redirect_back(:fallback_location => root_path) }
      format.js
    end
  end

  def destroy
    @club = Club.find(params[:club_id])
    current_student.club_unfavorite(@club)
    club_count(@club)

    respond_to do |format|
      format.html { redirect_back(:fallback_location => root_path) }
      format.js
    end
  end
end
