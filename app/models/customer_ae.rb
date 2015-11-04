class CustomerAE < ActiveRecord::Base
  self.table_name = "customers_ae"

  attr_encrypted :ssn, :dob, key: "a secret key"
end
