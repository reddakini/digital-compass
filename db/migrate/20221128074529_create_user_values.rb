class CreateUserValues < ActiveRecord::Migration[7.0]
  def change
    create_table :user_values do |t|
      t.integer :importance
      t.references :user, null: false, foreign_key: true
      t.references :value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
