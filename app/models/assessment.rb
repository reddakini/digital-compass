class Assessment < ApplicationRecord
  has_many :user_answers
  has_many :recommendations
end
