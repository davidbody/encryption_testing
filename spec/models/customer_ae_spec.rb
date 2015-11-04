require 'rails_helper'

RSpec.describe CustomerAE, type: :model do
  it "can be created" do
    c = CustomerAE.create
    expect(c).to be
  end

  context "encrypted attributes" do
    [:ssn, :dob].each do |attr|
      it "saves and retrieves #{attr}" do
        c = CustomerAE.new(first_name: "David", attr => "test")
        c.save!
        c.reload
        expect(c.send(attr)).to eq "test"
      end
    end
  end

  context "querying" do
    before do
      @customer = CustomerAE.create(first_name: "David", ssn: "999-88-7777")
    end

    it "can query by ssn using find_by_ssn" do
      customer = CustomerAE.find_by_ssn("999-88-7777")
      expect(customer).to eq @customer
    end

    it "can query by ssn using where" do
      customers = CustomerAE.where(encrypted_ssn: CustomerAE.encrypt_ssn("999-88-7777"))
      expect(customers).to contain_exactly(@customer)
    end
  end
end
