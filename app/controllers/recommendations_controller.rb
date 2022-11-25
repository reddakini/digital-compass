require "json"
require "open-uri"

class RecommendationsController < ApplicationController
  def add
    @recommendation = Recommendation.new
    @recommendation.user = current_user
    @recommendation.save
    url = "https://api.typeform.com/forms/DfXB0zI2/responses?included_response_ids=#{params[:response_id]}"
    response_serialized = URI.open(url, "Authorization" => "bearer #{ENV["TYPEFORM_API_KEY"]}").read
    response = JSON.parse(response_serialized)
    pp response
  end
end
