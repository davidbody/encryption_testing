class CustomerCK < ActiveRecord::Base
  self.table_name = "customers_ck"

  crypt_keeper :ssn, :dob, encryptor: :postgres_pgp, key: 'super_good_password', salt: 'salt'
end
