class ToppagesController < ApplicationController
  def home
    @events = Event.all

  end

end
