class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :age, :integer, null: false
    add_reference :runs, :user, index: true, foreign_key: true
  end
end
