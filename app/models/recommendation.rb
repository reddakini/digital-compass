class Recommendation < ApplicationRecord
  belongs_to :assessment
  belongs_to :pathway
end
