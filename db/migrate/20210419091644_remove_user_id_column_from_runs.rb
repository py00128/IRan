class RemoveUserIdColumnFromRuns < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :userID
    remove_reference :runs, :user, index: true, foreign_key: true
  end
end
