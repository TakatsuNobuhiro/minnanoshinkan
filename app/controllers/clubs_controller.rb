class ClubsController < ApplicationController

  def index
    @clubs=Club.all
  end


  def show
    @club = Club.find(params[:format])
  end


end
