class CustomerAE < ActiveRecord::Base
  self.table_name = "customers_ae"

  attr_encrypted :ssn, :dob, key: :encryption_key

  def encryption_key
    "a secret key"
  end
end
