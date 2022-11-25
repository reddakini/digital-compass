class CreateRecommendedPathways < ActiveRecord::Migration[7.0]
  def change
    create_table :recommended_pathways do |t|
      t.integer :match_score
      t.references :recommendation, null: false, foreign_key: true
      t.references :pathway, null: false, foreign_key: true

      t.timestamps
    end
  end
end
