class CreateUnencryptedCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.date :dob
      t.timestamps
    end
  end
end
