class AddUserIdToRun < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :userID, :integer
  end
end
