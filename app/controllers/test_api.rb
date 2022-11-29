require "open-uri"
require "json"

url = "https://api.typeform.com/forms/DfXB0zI2/responses?included_response_ids=hknyvdqzvvj588bk73hknyvd4czl2h7r"
response_serialized = URI.open(url, "Authorization" => "bearer tfp_B6SUUJAWXPwdow3b3VCuMCsG5zjZxnY2USduUsaP8xtf_3suGgcv3anhVet").read
response = JSON.parse(response_serialized)
# items = response["items"]
# items_hash = items[0]
answers = response["items"][0]["answers"]
# pp answers

ms_pathway1 = 0
ms_pathway2 = 0

puts "-----------------------------------"
answers.each do |answer|
  case answer["field"]["id"]
  when "H5XodAXBkEdj"
    case answer["choice"]["id"]
    when "gpVc5lvkkCQc"
      puts answer["choice"]["label"]
      ms_pathway1 += 5
      # when
    end
  when "kwO3rR1F8jyL"
    case answer["choice"]["id"]
    when "Sz8XTBZIln3e"
      puts answer["choice"]["label"]
      ms_pathway2 += 8
    # when
    end
  # when
  end
  # puts "answer text"
  # pp answer["choice"]["label"]
  # puts "\n"
  # puts "question id"
  # pp answer["field"]["id"]
  # puts "\n"
  # puts "answer id"
  # pp answer["choice"]["id"]
  puts "-----------------------------------"
end
