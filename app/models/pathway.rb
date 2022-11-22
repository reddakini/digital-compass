class Pathway < ApplicationRecord
  has_many :recommendations
  has_many :recommended_courses, through: :recommendations
  has_many :courses, through: :recommended_courses
end
