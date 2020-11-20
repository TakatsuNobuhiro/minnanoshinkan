class ClubsController < ApplicationController
  def index
    @clubs = Club.search(params[:search])
  end

  def show
    @club = Club.find(params[:id])
    club_count(@club)
  end
end
