class DashboardsController < ApplicationController
  def dashboard
    @progress_chart = {Done: 7, Left: 2}
    @result_chart = Pathway.group(:name).count
    @user_value = UserValue.new
    @user_skills = current_user.skills
  end
end
