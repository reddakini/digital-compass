class DashboardsController < ApplicationController
  def dashboard
    # total = 100
    # @progress_chart = {
    #   "Quiz" => current_user.recommendations.any? ? 50 : 0,
    #   "Skills Assessment" => current_user.skills.any? ? 25 : 0,
    #   "Values Assessment" => current_user.values.any? ? 25 : 0,
    #   # "Take Assessments to get matches": 000,
    #   "Take Assessments" => 0
    # }
    # @progress_chart["Take Assessments"] = total - @progress_chart["Quiz"] - @progress_chart["Skills Assessment"] - @progress_chart["Values Assessment"]

    @result_chart = Pathway.group(:name).count

    @user_value = UserValue.new
    @user_values = current_user.user_values.order(importance: :desc).limit(5)

    @user_skill = UserSkill.new
    @user_skills = current_user.skills

    @recommendation = Recommendation.where(user: current_user).last
    @recommended_pathways = RecommendedPathway.where(recommendation: @recommendation)
    # @recommended_pathways.sort_by! { |pathway| pathway.match_score.value }
  end
end
