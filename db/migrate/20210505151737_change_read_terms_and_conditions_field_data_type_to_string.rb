class ChangeReadTermsAndConditionsFieldDataTypeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :read_terms_and_conditions, :string, null: false, default: ""
  end
end
