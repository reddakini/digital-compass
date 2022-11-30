class RecommendationsController < ApplicationController
  def create
    @recommendation = Recommendation.new
    @recommendation.user = current_user
    @recommendation.save
    answers = Typeform.new(params[:response_id]).call
    MatchScoreCalc.new(answers, @recommendation).call
    sleep(3.0)
    redirect_to dashboard_path
  end
end
