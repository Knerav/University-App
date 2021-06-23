class StudentsController < ApplicationController
  before_action :student_params, only: [:show, :edit]

  def index
    @students = Student.all
  end

  def show
    
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_whitelist)
    if @student.save
      flash[:success] = "You have successfully registered"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def student_whitelist
    params.require(:student).permit(:name, :email)
  end

  def student_params
    @student = Student.find(params[:id])
  end

end