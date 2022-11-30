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
        match_score: (value.to_f / MAX_SCORES[key] * 100).to_i
      )
      recommended_pathway.save
    end
  end

  MATCHING_DATA = [
    {
      answer: "Theory",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 2 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Real-life",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Completing a puzzle",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Answering a question by using the internet",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Writing a story",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Do one task at a time until I finish",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Take breaks between each sub-task",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "A thrilling and exciting action movie",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "A character-driven drama",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "An insightful documentary about how things are built",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Admire it for its beauty",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Consider what makes this painting popular and important",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Wonder what techniques a painter used to paint it",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Follow the instructions precisely",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Look at the picture and wing it",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Taste as I go and adjust",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Looking things up as I need answers to them",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Learning everything about one topic",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Knowing a high level summary of ten topics",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Pictures",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Systems",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
      ]
    },
    {
      answer: "Stories",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 1 },
        { pathway: "FrontEnd Developer" , weight: 1 },
        { pathway: "FullStack Developer" , weight: 1 },
        { pathway: "Data Scientist" , weight: 1 },
        { pathway: "Data Analyst" , weight: 1 },
        { pathway: "Digital Consultant" , weight: 1 },
        { pathway: "Product Manager" , weight: 1 },
        { pathway: "UX/UI Designer" , weight: 1 },
        { pathway: "IT Project Manager" , weight: 1 }
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
