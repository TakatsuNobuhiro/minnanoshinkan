class StudentsController < ApplicationController
  before_action :set_student, except: [:index]
  def index
    @students = Student.with_attached_avatar.search(params[:search]).page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'students/students.js.erb' }
    end
  end

  def show
    club_like_events = []
    @student.club_likes.includes(:events).each do |club|
      club_like_events |= club.events
    end
    @event_likes = @student.event_likes
    @events = club_like_events | @event_likes
    @age = (Date.today.strftime("%Y%m%d").to_i - @student.birth_date.strftime("%Y%m%d").to_i)/10000
    counts(@student)
    respond_to do |format|
      format.html
      format.js
    end
  end
  def followings
    @students = @student.followings.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'students/students.js.erb' }
    end
  end

  def followers
    @students = @student.followers.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'students/students.js.erb' }
    end
  end

  def club_likes
    @clubs = @student.club_likes.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'clubs/clubs.js.erb' }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
