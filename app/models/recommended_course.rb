class RecommendedCourse < ApplicationRecord
  belongs_to :course
  belongs_to :pathway
end
