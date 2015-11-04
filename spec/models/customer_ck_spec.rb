require 'rails_helper'

RSpec.describe CustomerCK, type: :model do
  it "can be created" do
    c = CustomerCK.create
    expect(c).to be
  end

  context "encrypted attributes" do
    [:ssn, :dob].each do |attr|
      it "saves and retrieves #{attr}" do
        c = CustomerCK.new(first_name: "David", attr => "test")
        c.save!
        c.reload
        expect(c.send(attr)).to eq "test"
      end
    end
  end

  context "querying" do
    before do
      @customer = CustomerCK.create(first_name: "David", ssn: "999-88-7777")
    end

    it "can query by ssn using search_by_plaintext" do
      customers = CustomerCK.search_by_plaintext(:ssn, "999-88-7777")
      expect(customers).to contain_exactly @customer
    end
  end
end
