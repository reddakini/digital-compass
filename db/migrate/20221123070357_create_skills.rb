class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.references :skill_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
