# require "json"
require "open-uri"

class Typeform < ApplicationService
  def initialize(recommendation, params)
    @url = "https://api.typeform.com/forms/DfXB0zI2/responses?included_response_ids=#{params}"
    @recommendation = recommendation
  end

  def call
    typeform_parsing
  end

  private

  def typeform_parsing
    response_serialized = URI.open(@url, "Authorization" => "bearer #{ENV.fetch('TYPEFORM_API_KEY')}").read
    response = JSON.parse(response_serialized)

    # parsing for answer strings
    answers = response["items"][0]["answers"]
    answers.each do |answer|
      # pp answer["choice"]["label"]
    end

    # parsing for match_scores using custom variables
    # items = response["items"]
    # items_hash = items[0]
    # items_hash["variables"].each do |pathway_match_score|
    #   next if pathway_match_score["key"] == "score"

    #   found_pathway = find_pathway(pathway_match_score["key"])
    #   new_recommended_pathway = RecommendedPathway.new(
    #     pathway: found_pathway,
    #     match_score: pathway_match_score["number"],
    #     recommendation: @recommendation
    #   )
    #   new_recommended_pathway.save
    # end
  end

  def find_pathway(search_pathway)
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
    Pathway.find_by(name: translation_hash[search_pathway])
  end
end
