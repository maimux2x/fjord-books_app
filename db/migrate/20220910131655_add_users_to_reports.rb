class AddUsersToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :user, null: false, index: true
  end
end
