class UsersController < ApplicationController
  def index
    authorize! :read, User
  end

  def new
    @user = User.new
    authorize! :create, @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = 'User created successfully!'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.role.eql? 'Student'
      @student = ArchivedStudent.find_by_student_id(@user.student_id)
      if @student.nil?
        @student = Student.find(@user.student_id)
      end
    end
    if @user.role.eql? 'Employee'
      @employee = Employee.find(@user.employee_id)
    end
    if @user.role.eql? 'Parent'
      @student = ArchivedStudent.find_by_student_id(@user.student_id)
      if @student.nil?
        @student = Student.find(@user.student_id)
      end
    end
    authorize! :read, @user
  end

  def search
    unless params[:search].empty?

      @users = User.where("concat_ws(' ',first_name,last_name)like ?
        OR concat_ws(' ',last_name,first_name)like ?
        OR username like ?", "#{params[:search]}%", "#{params[:search]}%", "#{params[:search]}%")
    end
    authorize! :read, @user
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:user] = 'User updated successfully!'
    else
      render 'edit'
    end
  end

  def change_password
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = 'Password changed successfully!'
    else
      render 'change_password'
    end
  end

  def select
    @users = User.where("role Like '#{params[:user][:role]}'")
    authorize! :read, @user
  end

  def destroy
    authorize! :delete, @user
    @user = User.find(params[:id])
    @user.destroy
    flash[:user_delete] = 'User deleted successfully!'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
