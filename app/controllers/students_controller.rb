class StudentsController < ApplicationController
  before_action :set_student, except: [:index]
  def index
    @students = Student.with_attached_avatar.search(params[:search]).page(params[:params]).per(25)
  end

  def show
    club_like_events = []
    @student.club_likes.includes(:events).each do |club|
      club_like_events |= club.events
    end
    @event_likes = @student.event_likes
    @events = club_like_events | @event_likes
    counts(@student)
    respond_to do |format|
      format.html
      format.js
    end
  end
  def followings
    @followings = @student.followings.page(params[:params]).per(25)
    counts(@student)
  end

  def followers
    @followers = @student.followers.page(params[:params]).per(25)
    counts(@student)
  end

  def club_likes
    @club_likes = @student.club_likes.page(params[:params]).per(25)
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
