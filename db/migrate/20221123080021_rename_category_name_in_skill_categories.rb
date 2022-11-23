class RenameCategoryNameInSkillCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :skill_categories, :category_name, :name
  end
end
