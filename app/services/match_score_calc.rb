class MatchScoreCalc < ApplicationService
  def initialize(answers, recommendation)
    @answers = answers
    @recommendation = recommendation
    @scores = {
      "BackEnd Developer" => 0,
      "FrontEnd Developer" => 0,
      "FullStack Developer" => 0,
      "Data Scientist" => 0,
      "Data Analyst" => 0,
      "Digital Consultant" => 0,
      "Product Manager" => 0,
      "UX/UI Designer" => 0,
      "IT Project Manager" => 0
    }
    MATCHING_DATA.each do |hash|
      pathways = hash[:pathways]
      pathways.each do |element|
        pathway = element[:pathway]
        weight = element[:weight]
        MAX_SCORES[pathway] += weight
      end
    end
  end

  def call
    @answers.each do |answer|
      find_matching_data = MATCHING_DATA.find { |element| element[:answer] == answer }
      find_matching_data[:pathways].each do |element|
        pathway = element[:pathway]
        @scores[pathway] += element[:weight]
      end
    end
    save
  end

  private

  def find_pathway(key)
    Pathway.find_by(name: key)
  end

  def save
    @scores.each do |key, value|
      pathway = find_pathway(key)
      recommended_pathway = RecommendedPathway.new(
        recommendation: @recommendation,
        pathway: pathway,
        # Calculation needs to be enhanced, so that the result gets closer to 100% but not exceeds it!
        match_score: (value.to_f / MAX_SCORES[key] * 150).to_i
      )
      recommended_pathway.save
    end
  end

  MATCHING_DATA = [
    {
      answer: "Theory",
      pathways: [
        { pathway: "BackEnd Developer", weight: 5 },
        { pathway: "FrontEnd Developer", weight: 3 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 5 },
        { pathway: "Data Analyst", weight: 4 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 1 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Real-life",
      pathways: [
        { pathway: "BackEnd Developer", weight: 2 },
        { pathway: "FrontEnd Developer", weight: 4 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 5 },
        { pathway: "Product Manager", weight: 4 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Completing a puzzle",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 5 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 1 },
        { pathway: "UX/UI Designer", weight: 1 },
        { pathway: "IT Project Manager", weight: 2 }
      ]
    },
    {
      answer: "Answering a question by using the internet",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 5 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Writing a story",
      pathways: [
        { pathway: "BackEnd Developer", weight: 1 },
        { pathway: "FrontEnd Developer", weight: 3 },
        { pathway: "FullStack Developer", weight: 2 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 1 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Do one task at a time until I finish",
      pathways: [
        { pathway: "BackEnd Developer", weight: 4 },
        { pathway: "FrontEnd Developer", weight: 3 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 3 },
        { pathway: "Data Analyst", weight: 3 },
        { pathway: "Digital Consultant", weight: 2 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 3 },
        { pathway: "IT Project Manager", weight: 1 }
      ]
    },
    {
      answer: "Take breaks between each sub-task",
      pathways: [
        { pathway: "BackEnd Developer", weight: 2 },
        { pathway: "FrontEnd Developer", weight: 1 },
        { pathway: "FullStack Developer", weight: 2 },
        { pathway: "Data Scientist", weight: 3 },
        { pathway: "Data Analyst", weight: 3 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 4 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "A thrilling and exciting action movie",
      pathways: [
        { pathway: "BackEnd Developer", weight: 2 },
        { pathway: "FrontEnd Developer", weight: 5 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 1 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 4 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "A character-driven drama",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 5 },
        { pathway: "UX/UI Designer", weight: 3 },
        { pathway: "IT Project Manager", weight: 5 }
      ]
    },
    {
      answer: "An insightful documentary about how things are built",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 4 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 1 },
        { pathway: "UX/UI Designer", weight: 2 },
        { pathway: "IT Project Manager", weight: 1 }
      ]
    },
    {
      answer: "Admire it for its beauty",
      pathways: [
        { pathway: "BackEnd Developer", weight: 1 },
        { pathway: "FrontEnd Developer", weight: 4 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 2 }
      ]
    },
    {
      answer: "Consider what makes this painting popular and important",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 1 },
        { pathway: "Data Scientist", weight: 3 },
        { pathway: "Data Analyst", weight: 4 },
        { pathway: "Digital Consultant", weight: 5 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 4 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "Wonder what techniques a painter used to paint it",
      pathways: [
        { pathway: "BackEnd Developer", weight: 4 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 5 },
        { pathway: "Data Scientist", weight: 5 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 2 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "Follow the instructions precisely",
      pathways: [
        { pathway: "BackEnd Developer", weight: 5 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 5 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 1 },
        { pathway: "IT Project Manager", weight: 2 }
      ]
    },
    {
      answer: "Look at the picture and wing it",
      pathways: [
        { pathway: "BackEnd Developer", weight: 1 },
        { pathway: "FrontEnd Developer", weight: 5 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 1 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Taste as I go and adjust",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 4 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 3 },
        { pathway: "Data Analyst", weight: 3 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 4 },
        { pathway: "UX/UI Designer", weight: 4 },
        { pathway: "IT Project Manager", weight: 5 }
      ]
    },
    {
      answer: "Looking things up as I need answers to them",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 5 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 2 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 4 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "Learning everything about one topic",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 2 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 4 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 1 },
        { pathway: "IT Project Manager", weight: 1 }
      ]
    },
    {
      answer: "Knowing a high level summary of ten topics",
      pathways: [
        { pathway: "BackEnd Developer", weight: 2 },
        { pathway: "FrontEnd Developer", weight: 3 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 2 },
        { pathway: "Data Analyst", weight: 3 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 5 },
        { pathway: "UX/UI Designer", weight: 3 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "Pictures",
      pathways: [
        { pathway: "BackEnd Developer", weight: 3 },
        { pathway: "FrontEnd Developer", weight: 4 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 4 },
        { pathway: "Product Manager", weight: 4 },
        { pathway: "UX/UI Designer", weight: 5 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    },
    {
      answer: "Systems",
      pathways: [
        { pathway: "BackEnd Developer", weight: 5 },
        { pathway: "FrontEnd Developer", weight: 3 },
        { pathway: "FullStack Developer", weight: 4 },
        { pathway: "Data Scientist", weight: 5 },
        { pathway: "Data Analyst", weight: 5 },
        { pathway: "Digital Consultant", weight: 1 },
        { pathway: "Product Manager", weight: 2 },
        { pathway: "UX/UI Designer", weight: 2 },
        { pathway: "IT Project Manager", weight: 4 }
      ]
    },
    {
      answer: "Stories",
      pathways: [
        { pathway: "BackEnd Developer", weight: 2 },
        { pathway: "FrontEnd Developer", weight: 4 },
        { pathway: "FullStack Developer", weight: 3 },
        { pathway: "Data Scientist", weight: 1 },
        { pathway: "Data Analyst", weight: 2 },
        { pathway: "Digital Consultant", weight: 3 },
        { pathway: "Product Manager", weight: 3 },
        { pathway: "UX/UI Designer", weight: 4 },
        { pathway: "IT Project Manager", weight: 3 }
      ]
    }
  ]

  MAX_SCORES = {
    "BackEnd Developer" => 0,
    "FrontEnd Developer" => 0,
    "FullStack Developer" => 0,
    "Data Scientist" => 0,
    "Data Analyst" => 0,
    "Digital Consultant" => 0,
    "Product Manager" => 0,
    "UX/UI Designer" => 0,
    "IT Project Manager" => 0
  }
end

# Comments from Cornelius!!! Please leave here

# MAX_SCORES
# {"BackEnd Developer"=>63, "FrontEnd Developer"=>70, "FullStack Developer"=>74, "Data Scientist"=>58, "Data Analyst"=>67, "Digital Consultant"=>61, "Product Manager"=>64, "UX/UI Designer"=>75, "IT Project Manager"=>67}

# USER_SCORES
# {"BackEnd Developer"=>30, "FrontEnd Developer"=>24, "FullStack Developer"=>32, "Data Scientist"=>32, "Data Analyst"=>32, "Digital Consultant"=>15, "Product Manager"=>17, "UX/UI Designer"=>19, "IT Project Manager"=>24}

# RecommendedPathway.where(recommendation: Recommendation.last).each { |p| pp "#{p.pathway.name} - #{p.match_score}" }
