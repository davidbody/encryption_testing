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
end
