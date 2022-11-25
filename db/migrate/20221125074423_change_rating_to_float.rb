class ChangeRatingToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :rating, :float
  end
end
