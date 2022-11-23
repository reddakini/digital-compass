class Recommendation < ApplicationRecord
  belongs_to :assessment
  belongs_to :pathway
  has_many :recommended_courses, through: :pathway
  has_many :courses, through: :recommended_courses
end
