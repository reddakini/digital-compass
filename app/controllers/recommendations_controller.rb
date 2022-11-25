require "json"
require "open-uri"

class RecommendationsController < ApplicationController
  # TODO: needs to be refactored!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  def add
    @recommendation = Recommendation.new
    @recommendation.user = current_user
    @recommendation.save
    url = "https://api.typeform.com/forms/DfXB0zI2/responses?included_response_ids=#{params[:response_id]}"
    response_serialized = URI.open(url, "Authorization" => "bearer #{ENV.fetch('TYPEFORM_API_KEY')}").read
    response = JSON.parse(response_serialized)
    items = response["items"]
    items_hash = items[0]
    translation_hash = {
      "backend_developer" => "BackEnd Developer",
      "data_analyst" => "Data Analyst",
      "data_scientist" => "Data Scientist",
      "digital_consultant" => "Digital Consultant",
      "frontend_developer" => "FrontEnd Developer",
      "fullstack_developer" => "FullStack Developer",
      "it_project_manager" => "IT Project Manager",
      "product_manager" => "Product Manager",
      "ux_ui_designer" => "UX/UI Designer"
    }
    items_hash["variables"].each do |pathway_match_score|
      unless pathway_match_score["key"] == "score"
        found_pathway = Pathway.find_by(name: translation_hash[pathway_match_score["key"]])
        new_recommended_pathway = RecommendedPathway.new(
          pathway: found_pathway,
          match_score: pathway_match_score["number"],
          recommendation: @recommendation
        )
        new_recommended_pathway.save
      end
    end
    redirect_to dashboard_path
  end
end
