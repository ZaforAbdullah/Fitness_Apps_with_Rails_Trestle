class ActivityAnalysesController < ApplicationController
  before_action :authenticate_user!

  def show
    @analysis = current_user.analyze_activity
  end
end
