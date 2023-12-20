
class StampsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @stamps = Stamp.all
    end
  
    def buy
        stamp = Stamp.find(params[:id])
        if current_user.cents >= stamp.value
          current_user.update!(cents: current_user.cents - stamp.value)
    
          # Create a record in the join table
          current_user.user_stamps.create!(stamp: stamp, quantity: 1) # Adjust quantity as needed
    
          redirect_to stamps_path, notice: 'Stamp purchased successfully!'
        else
          redirect_to stamps_path, alert: 'Not enough Cents to purchase this stamp.'
        end
      end
  end
  