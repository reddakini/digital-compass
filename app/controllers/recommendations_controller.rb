class RecommendationsController < ApplicationController
  def create
    @recommendation = Recommendation.new
    @recommendation.user = current_user
    @recommendation.save
    Typeform.new(@recommendation, params[:response_id]).call
    # MatchScoreCalculation.new().call
    sleep(3.0)
    redirect_to dashboard_path
  end
end
