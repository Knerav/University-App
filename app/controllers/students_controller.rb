class StudentsController < ApplicationController

  def index
    @students = Student.all
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

end