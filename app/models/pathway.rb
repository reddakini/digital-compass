class Pathway < ApplicationRecord
  # has_many :recommendations, through: :recommended_pathways
  has_many :recommended_courses
  has_many :courses, through: :recommended_courses

  validates :name, presence: true
  validates :description, presence: true
  validates :description_short, presence: true
  validates :category, presence: true
  validates :suit_for, presence: true
  validates :job_roles, presence: true
  validates :avg_salary, presence: true
  validates :avg_salary, numericality: { only_integer: true }
  validates :projected_growth, presence: true
  validates :projected_growth, length: { minimum: 2 }
end
