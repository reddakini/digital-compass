class CreatePathwaySkills < ActiveRecord::Migration[7.0]
  def change
    create_table :pathway_skills do |t|
      t.integer :importance
      t.references :pathway, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
