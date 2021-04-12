class CreateHelps < ActiveRecord::Migration[5.2]
  def change
    create_table :helps do |t|
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
