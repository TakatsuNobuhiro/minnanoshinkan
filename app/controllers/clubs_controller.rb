class ClubsController < ApplicationController
  def index
    @clubs = Club.with_attached_avatar.search(params[:search]).page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'clubs/clubs.js.erb' }
    end
  end

  def show
    @club = Club.find(params[:id])
    @events = @club.events
    club_count(@club)
    respond_to do |format|
      format.html
      format.js { render template: './layouts/calendar.js.erb' }
    end
  end

  def student_likes
    @club = Club.find(params[:id])
    @students = @club.student_likes.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'students/students.js.erb' }
    end
  end
end
