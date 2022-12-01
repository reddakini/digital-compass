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
    @progress = [
      current_user.recommendations.any? ? 50 : 0,
      current_user.skills.any? ? 25 : 0,
      current_user.values.any? ? 25 : 0
    ]
    if @progress.sum == 50
      @progress_class = "half"
    elsif @progress.sum == 75
      @progress_class = "three-q"
    elsif @progress.sum == 100
      @progress_class = "full"
    end

    @result_chart = Pathway.group(:name).count

    @user_value = UserValue.new
    @user_values = current_user.user_values.order(importance: :desc).limit(5)

    @user_skill = UserSkill.new
    @user_skills = current_user.skills

    @recommendation = Recommendation.where(user: current_user).last
    @recommended_pathways = RecommendedPathway.where(recommendation: @recommendation).order(match_score: :desc).first(5)
    # @reco_pathways_for_chart =
  end
end
