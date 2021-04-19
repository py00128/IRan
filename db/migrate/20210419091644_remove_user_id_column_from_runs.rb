class RemoveUserIdColumnFromRuns < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :userID
  end
end
