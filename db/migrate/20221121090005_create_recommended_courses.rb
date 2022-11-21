class CreateRecommendedCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :recommended_courses do |t|
      t.references :course, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
