class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :recommended_pathways
  has_many :pathways, through: :recommended_pathways
end
