class RemoveImportanceFromPathwaySkill < ActiveRecord::Migration[7.0]
  def change
    remove_column :pathway_skills, :importance, :integer
  end
end
