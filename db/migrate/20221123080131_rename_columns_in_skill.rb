class RenameColumnsInSkill < ActiveRecord::Migration[7.0]
  def change
    rename_column :skills, :skill_name, :name
  end
end
