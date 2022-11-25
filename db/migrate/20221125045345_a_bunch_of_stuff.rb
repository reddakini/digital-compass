class ABunchOfStuff < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recommendations, :assessment
    drop_table :user_answers
    drop_table :assessments
    remove_column :recommendations, :match_score, :integer
    remove_reference :recommendations, :pathway
    add_reference :recommendations, :user, null: false, index: true, foreign_key: true
  end
end
