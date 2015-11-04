class ChangeFieldsToText < ActiveRecord::Migration
  def change
    change_column :customers_ck, :ssn, :text
    change_column :customers_ck, :dob, :text
  end
end
