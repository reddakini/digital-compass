class AddNameToValues < ActiveRecord::Migration[7.0]
  def change
    add_column :values, :name, :string
  end
end
