require 'rails_helper'

RSpec.describe CustomerAE, type: :model do
  it "can be created" do
    c = CustomerAE.create
    expect(c).to be
  end
end
