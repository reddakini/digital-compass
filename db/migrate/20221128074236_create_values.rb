class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|

      t.timestamps
    end
  end
end
