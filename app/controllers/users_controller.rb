class UsersController < ApplicationController

	def new 
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			flash[:user]="User created successfully!"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def show
		@user=User.find(params[:id])
		@student=Student.find_by_admission_no(@user.username.to_s)
	end

	def search
	  unless params[:search].empty?
	  	@users=User.where("first_name like'#{params[:search]}%' 
      			OR last_name like'#{params[:search]}%'")
	  end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
			@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
			flash[:user]="User updated successfully!"
		else 
			render 'edit'
		end 
	end

	def change_password
		@user=User.find(params[:id])
	end

	def update_password
		@user=User.find(params[:id])
		if User.authenticate?(@user.username, params[:user][:old_password])
		        if params[:user][:new_password] == params[:user][:confirm_password]
		        	@user.password=params[:user][:new_password] 
		            if @user.update(user_params)
			           flash[:edit] = "password update successfully"
		        	   redirect_to edit_user_path(@user)
		        	else
		        		render 'change_password'
		        	end
		        else
		          flash[:notice] = "New password and confirm password not match"
	        	  render 'change_password'	       
	        	end
	    else
        flash[:notice] = "Please Enter correct old password"
        render 'change_password'
      end
	end

	def select
		@users=User.where("role Like '#{params[:user][:role]}'")
	end
	
	def destroy
		@user=User.find(params[:id])
		@user.destroy
		flash[:user_delete]="User deleted successfully!"
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:username,:first_name,:last_name,:password,:email,:role,:hashed_password)
	end
end
