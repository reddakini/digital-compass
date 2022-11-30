class MatchScoreCalc < ApplicationService
  def initialize(answers, recommendation)
    @answers = answers
    @recommendation = recommendation
    # add wights for every role -> 100%
    # match_score = total personal weight / max weight * 100
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
  end

  def call
    @answers.each do |answer|
      find_matching_data = MATCHING_DATA.select { |element| element[answer:] = answer }
      find_matching_data[pathways:].each do |element|
        max_score =
        score =
        @scores[element[pathway:]] += element[weight:]
      end
    end
    save
  end

  private

  def find_pathway(search_pathway)
    Pathway.find_by(name: translation_hash[search_pathway])
  end

  def save
    @scores.each do |key, value| {
      pathway = find_pathway(key)
      recommended_pathway = RecommendedPathway.new(
        recommendation: @recommendation,
        pathway: pathway,
        match_score: value
      )
      recommended_pathway.save
    }
  end

  MATCHING_DATA = [
    {
      answer: "Theory",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Real-life",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Completing a puzzle",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Answering a question by using the internet",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Writing a story",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Do one task at a time until I finish",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Take breaks between each sub-task",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "A thrilling and exciting action movie",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "A character-driven drama",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "An insightful documentary about how things are built",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Admire it for its beauty",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Consider what makes this painting popular and important",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Wonder what techniques a painter used to paint it",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Follow the instructions precisely",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Look at the picture and wing it",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Taste as I go and adjust",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Looking things up as I need answers to them",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Learning everything about one topic",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Knowing a high level summary of ten topics",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Pictures",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Systems",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    },
    {
      answer: "Stories",
      pathways: [
        { pathway: "BackEnd Developer" , weight: 0 },
        { pathway: "FrontEnd Developer" , weight: 0 },
        { pathway: "FullStack Developer" , weight: 0 },
        { pathway: "Data Scientist" , weight: 0 },
        { pathway: "Data Analyst" , weight: 0 },
        { pathway: "Digital Consultant" , weight: 0 },
        { pathway: "Product Manager" , weight: 0 },
        { pathway: "UX/UI Designer" , weight: 0 },
        { pathway: "IT Project Manager" , weight: 0 }
      ]
    }
  ]
end

# typeform quiz answers: [
    #   "Theory",
    #   "Real-life",
    #   "Completing a puzzle",
    #   "Answering a question by using the internet",
    #   "Writing a story",
    #   "Do one task at a time until I finish",
    #   "Take breaks between each sub-task",
    #   "A thrilling and exciting action movie",
    #   "A character-driven drama",
    #   "An insightful documentary about how things are built",
    #   "Admire it for its beauty",
    #   "Consider what makes this painting popular and important",
    #   "Wonder what techniques a painter used to paint it",
    #   "Follow the instructions precisely",
    #   "Look at the picture and wing it",
    #   "Taste as I go and adjust",
    #   "Looking things up as I need answers to them",
    #   "Learning everything about one topic",
    #   "Knowing a high level summary of ten topics",
    #   "Pictures",
    #   "Systems",
    #   "Stories"
    # ]
