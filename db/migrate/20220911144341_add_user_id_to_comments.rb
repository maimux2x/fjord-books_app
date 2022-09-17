class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM comments;'
    add_reference :comments, :user
  end

  def down
    remove_reference :comments, :user
  end
end
