class DashboardsController < ApplicationController
  def dashboard
    @progress_chart = {Done: 7, Left: 2}
    @result_chart = Pathway.group(:name).count
    @user_value = UserValue.new
    @user_skills = current_user.skills
    @recommendation = Recommendation.where(user: current_user).last
    @recommended_pathways = RecommendedPathway.where(recommendation: @recommendation)
    # @recommended_pathways.sort_by! { |pathway| pathway.match_score.value }
  end
end
