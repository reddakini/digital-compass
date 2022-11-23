class RemoveRecommendationFromRecommendedCourses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recommended_courses, :recommendation
  end
end
