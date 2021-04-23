class AddColumnsToRunsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :starting_point, :string, null: false, default: ""
    add_column :runs, :destination, :string, null: false, default: ""
    add_column :runs, :date, :string, null: false, default: Date.new
  end
end
