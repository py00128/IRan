class RemoveUserIdFromRun < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :runID
  end
end
