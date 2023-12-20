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
    # DELETE THIS BUTTON/Function
    def add_cents
      if current_user.last_cents_added_on.nil? || current_user.last_cents_added_on < Date.today
        new_cents_value = current_user.cents + 5
        if new_cents_value <= 15
          current_user.update(cents: new_cents_value, last_cents_added_on: Date.today)
          redirect_back(fallback_location: root_path, notice: '5 Cents added successfully!')
        else
          redirect_back(fallback_location: root_path, alert: 'You cannot have more than 15 Cents.')
        end
      else
        redirect_back(fallback_location: root_path, alert: 'You can only add 5 Cents once per day.')
      end
    end
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
  end