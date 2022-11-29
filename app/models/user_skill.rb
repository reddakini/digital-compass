class UserSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  validates :user, uniqueness: {scope: :skill}

end
