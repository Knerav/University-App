class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new

  end

  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    if student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      flash[:success] = "You have successfully logged in"
      if student.admin?
        redirect_to root_path
      else
        redirect_to student
      end
    else
      flash.now[:warning] = "Please enter valid credentials"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

end