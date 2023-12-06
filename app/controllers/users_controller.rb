class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Handle successful user registration
        redirect_to @user, notice: 'User was successfully created.'
      else
        # Handle user registration errors
        render :new
      end
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        # Handle successful profile update
        redirect_to @user, notice: 'Profile was successfully updated.'
      else
        # Handle profile update errors
        render :edit
      end
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    private
  
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
  end
  