class RenameModels < ActiveRecord::Migration
  def change
    rename_table :customers, :customers_ae
    rename_table :customer2s, :customers_ck
  end
end
