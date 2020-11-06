class ClubsController < ApplicationController

  def index
    @clubs=Club.all
  end


  def show
    @student = Club.find(params[:format])
  end


end
