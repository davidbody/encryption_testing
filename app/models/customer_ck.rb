class CustomerCK < ActiveRecord::Base
  self.table_name = "customers_ck"

  crypt_keeper :ssn, :dob, encryptor: :aes_new, key: 'super_good_password', salt: 'salt'
end
