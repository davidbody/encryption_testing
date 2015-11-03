class ChangeDob < ActiveRecord::Migration
  def change
    change_column :customers_ae, :encrypted_dob, :string
  end
end
