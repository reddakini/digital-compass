class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.integer :match_score
      t.references :assessment, null: false, foreign_key: true
      t.references :pathway, null: false, foreign_key: true

      t.timestamps
    end
  end
end
