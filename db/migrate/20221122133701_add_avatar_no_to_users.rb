class AddAvatarNoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_no, :integer
  end
end
