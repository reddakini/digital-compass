class Course < ApplicationRecord
  has_many :recommended_courses
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :rating, presence: true
end
