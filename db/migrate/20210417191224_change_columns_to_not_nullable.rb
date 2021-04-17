class ChangeColumnsToNotNullable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :emailAddress, :string, null: false
    change_column :users, :age, :integer, null: false
    change_column :runs, :userID, :integer, null: false
    change_column :helps, :name, :string, null: false
    change_column :helps, :email, :string, null: false
    change_column :helps, :message, :string, null: false
  end
end
