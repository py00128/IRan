class AddUserToRuns < ActiveRecord::Migration[5.2]
  def change
    add_reference :runs, :user, index: true, foreign_key: true
  end
end
