class AddReadTermsAndConditionsFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :read_terms_and_conditions, :boolean, null: false, default: false
  end
end
