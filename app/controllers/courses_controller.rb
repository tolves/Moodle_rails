class CoursesController < ApplicationController
  before_action :check_policies

  def index
    @courses = Course.all
    @header_title = :Courses
    respond_to do |format|
      format.json { render json: @courses }
      format.html { render :index }
    end
  end

  def show
    # TODO: courses could customise set modules(wikis/others)
    # TODO: select users/groups into courses(a quick link with policy)

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new params_course
    @course.save
    redirect_to courses_path
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def params_course
    params.require(:course).permit([:name])
  end
end
