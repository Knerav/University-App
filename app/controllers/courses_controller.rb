class CoursesController < ApplicationController
  skip_before_action :require_user, only: [:index]
  before_action :course_params, only: [:show, :edit, :update]

  def index
    @courses = Course.all
  end

  def show

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_whitelist)
    if @course.save
      flash[:success] = "Course created successfully"
      redirect_to @course
    else
      flash[:warning] = "Enter valid course details"
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @course.update(course_whitelist)
      flash[:success] = "The course was successfully updated"
      redirect_to @course
    else
      render 'edit'
    end
  end

  private

  def course_whitelist
    params.require(:course).permit(:short_name, :name, :description, category_ids: [])
  end

  def course_params
    @course = Course.find(params[:id])
  end

end