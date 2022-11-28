class UserValue < ApplicationRecord
  belongs_to :user
  belongs_to :value
end
