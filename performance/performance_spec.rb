require 'rails_helper'

RSpec.describe "performance" do
  context "attr_encrypted" do
    it 'should be fast' do
      Benchmark.bm(20) do |bm|
        bm.report("attr_encrypted") do
          1000.times { CustomerAE.where(encrypted_ssn: CustomerAE.encrypt_ssn("123-45-6789")) }
        end
      end
    end
  end

  context "crypt_keeper" do
    it 'should be fast' do
      Benchmark.bm(20) do |bm|
        bm.report("crypt_keeper") do
          1000.times { CustomerCK.search_by_plaintext(:ssn, "123-45-6789") }
        end
      end
    end
  end
end

# Randomized with seed 16309
#                            user     system      total        real
# attr_encrypted         0.890000   0.000000   0.890000 (  0.890329)
#                            user     system      total        real
# crypt_keeper           0.040000   0.010000   0.050000 (  0.045644)
#
#
# Finished in 0.93964 seconds (files took 1.48 seconds to load)
# 2 examples, 0 failures
