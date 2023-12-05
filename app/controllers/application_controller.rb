class ApplicationController < ActionController::Base
    around_action :use_user_time_zone, if: :current_user
  
    private
  
    def use_user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end
  end
  