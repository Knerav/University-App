class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :student_params, only: [:show, :edit, :update]
  before_action :require_same_student, only: [:edit, :update]

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
    if @student.update(student_whitelist)
      flash[:success] = "You have successfully updated your profile"
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def student_whitelist
    params.require(:student).permit(:name, :email, :password)
  end

  def student_params
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student
      flash[:warning] = "The dean would like to meet you, edit your own profile!"
      redirect_to student_path(current_user)
    end
  end
  
end