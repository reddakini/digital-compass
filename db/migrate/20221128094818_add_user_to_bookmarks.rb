class AddUserToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :user, null: false, foreign_key: true
    add_reference :bookmarks, :pathway, null: false, foreign_key: true
  end
end
