class ClubsController < ApplicationController
  def index
    @clubs = Club.with_attached_avatar.search(params[:search])
  end

  def show
    @club = Club.find(params[:id])
    club_count(@club)
  end
end
