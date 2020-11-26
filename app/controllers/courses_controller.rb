class CoursesController < ApplicationController
  def index
    @courses = Course.all
    respond_to do |format|
      format.json { render json: @courses }
      format.html { render :index }
    end
  end

  def show; end

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
