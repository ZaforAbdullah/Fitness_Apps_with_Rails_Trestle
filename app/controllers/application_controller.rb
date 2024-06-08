#class ApplicationController < ActionController::Base
#end


class ApplicationController < ActionController::Base
    include Pundit
  
    # Uncomment this line if you want Pundit to raise an error when authorization is not performed
    # after_action :verify_authorized, except: :index
    # after_action :verify_policy_scoped, only: :index
  
    # Rescue Pundit errors and handle them appropriately
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def record_not_found
      flash[:alert] = "The record you were looking for could not be found."
      redirect_to root_path
    end
  end
  