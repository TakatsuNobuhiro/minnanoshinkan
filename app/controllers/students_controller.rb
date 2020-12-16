class StudentsController < ApplicationController
  before_action :set_student, except: [:index]
  def index
    set_category
    students = Student.all
    if student_signed_in? && params[:category_id].blank?
      params[:category_id] = current_student.category.parent_id
    elsif club_signed_in? && params[:category_id].blank?
      params[:category_id] = current_club.category.id
    end

    students = students.search(params[:name]) if params[:name].present?
    students = students.where(prefecture: Student.prefectures[params[:prefecture]]) if params[:prefecture].present? && !(params[:prefecture] == '---')
    students = students.where(gender: params[:gender]) if params[:gender].present?
    students = students if params[:category_id].present?
    @students = students.with_attached_avatar.page(params[:page]).per(25)
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

    @age = (Date.today.strftime("%Y%m%d").to_i - @student.birth_date.strftime("%Y%m%d").to_i) / 10_000 if @student.birth_date

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
