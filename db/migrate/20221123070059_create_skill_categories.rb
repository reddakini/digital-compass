class CreateSkillCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_categories do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
