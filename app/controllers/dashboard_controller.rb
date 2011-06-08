class DashboardController < ApplicationController
  def index
    @submissions = Submission.all(conditions: { user_id: current_user.id}) 
  end
end
