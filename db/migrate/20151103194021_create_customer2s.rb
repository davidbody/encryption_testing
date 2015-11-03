class CreateCustomer2s < ActiveRecord::Migration
  def change
    create_table :customer2s do |t|
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.date :dob
      t.timestamps null: false
    end

    change_column_null :customers, :created_at, false
    change_column_null :customers, :updated_at, false
  end
end
