require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "can be created" do
    c = Customer.create
    expect(c).to be
  end
end
