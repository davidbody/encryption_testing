require 'rspec/core/rake_task'
require 'benchmark'

Rails.env = "test"

desc "Seed test database for performance examples"
task performance_seed_db: :environment do
#                            user     system      total        real
# attr_encrypted       324.260000  13.480000 337.740000 (373.997343)
# crypt_keeper         1232.760000 190.410000 1423.170000 (4479.264175)
#
  n = 100_000

  puts "Seeding #{Rails.env} database with performance data..."

  Benchmark.bm(20) do |bm|
    bm.report("attr_encrypted") do
      puts "Creating #{n} attr_encrypted records..."
      CustomerAE.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('customers_ae')

      n.times do |i|
        puts i if i % 1_000 == 0
        params = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          ssn: Faker::Base.numerify("###-##-####"),
          dob: Faker::Date.between(100.years.ago, Date.today)
        }
        CustomerAE.create params
      end
    end

    bm.report("crypt_keeper") do
      puts "Creating #{n} crypt_keeper records..."
      CustomerCK.delete_all
      ActiveRecord::Base.connection.reset_pk_sequence!('customers_ck')
      n.times do |i|
        puts i if i % 1_000 == 0
        params = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          ssn: Faker::Base.numerify("###-##-####"),
          dob: Faker::Date.between(100.years.ago, Date.today)
        }
        CustomerCK.create params
      end
    end
  end
end

desc "Run performance examples"
RSpec::Core::RakeTask.new(:performance) do |t|
  t.pattern = './performance/**/*_spec.rb'
  t.rspec_opts = "-I performance --color --order random"
end
