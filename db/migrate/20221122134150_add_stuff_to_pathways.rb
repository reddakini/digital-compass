class AddStuffToPathways < ActiveRecord::Migration[7.0]
  def change
    add_column :pathways, :category, :string
    add_column :pathways, :description_short, :string
    add_column :pathways, :suit_for, :text
    add_column :pathways, :job_roles, :string
    add_column :pathways, :avg_salary, :integer
    add_column :pathways, :projected_growth, :string
  end
end
