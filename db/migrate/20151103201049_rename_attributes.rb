class RenameAttributes < ActiveRecord::Migration
  def change
    rename_column :customers_ae, :ssn, :encrypted_ssn
    rename_column :customers_ae, :dob, :encrypted_dob
  end
end
