require 'rails_helper'

RSpec.describe "performance" do
  context "unencrypted" do
    it 'should be fast' do
      Benchmark.bm(20) do |bm|
        bm.report("unencrypted") do
          10.times { Customer.where(ssn: "123-45-6789").first }
        end
      end
    end
  end

  context "attr_encrypted" do
    it 'should be fast' do
      Benchmark.bm(20) do |bm|
        bm.report("attr_encrypted") do
          10.times { CustomerAE.where(encrypted_ssn: CustomerAE.encrypt_ssn("123-45-6789")).first }
        end
      end
    end
  end

  context "crypt_keeper" do
    it 'should be fast' do
      Benchmark.bm(20) do |bm|
        bm.report("crypt_keeper") do
          10.times { CustomerCK.search_by_plaintext(:ssn, "123-45-6789").first }
        end
      end
    end
  end
end


# Randomized with seed 31817
#                            user     system      total        real
# unencrypted            0.010000   0.000000   0.010000 (  0.158169)
# crypt_keeper           0.010000   0.010000   0.020000 (347.166144)
# attr_encrypted         0.010000   0.000000   0.010000 (  0.158654)
#
# Finished in 5 minutes 47 seconds (files took 1.56 seconds to load)
# 3 examples, 0 failures
