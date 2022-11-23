class AddPathwayToRecommendedCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :recommended_courses, :pathway, null: false, foreign_key: true
  end
end
