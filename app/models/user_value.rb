class UserValue < ApplicationRecord
  belongs_to :user
  belongs_to :value
  validates :user, uniqueness: {scope: :value}
end
