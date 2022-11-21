class Recommendation < ApplicationRecord
  belongs_to :assessment
  belongs_to :pathway
  has_many :recommended_courses
end
