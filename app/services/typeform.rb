# require "json"
require "open-uri"

class Typeform < ApplicationService
  def initialize(params)
    @url = "https://api.typeform.com/forms/DfXB0zI1/responses?included_response_ids=#{params}"
  end

  def call
    typeform_parsing
  end

  private

  def typeform_parsing
    response_serialized = URI.open(@url, "Authorization" => "bearer #{ENV.fetch('TYPEFORM_API_KEY')}").read
    response = JSON.parse(response_serialized)
    answers = []
    response["items"][0]["answers"].each do |answer|
      answers << answer["choice"]["label"]
    end
    return answers
  end
end
