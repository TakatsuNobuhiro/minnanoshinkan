class ToppagesController < ApplicationController
  def home
    @events = Event.all
    respond_to do |format|
      format.html
      format.js { render template: './layouts/calendar.js.erb' }
    end
  end
end
