require 'rails_helper'

RSpec.describe CustomerCK, type: :model do
  it "can be created" do
    c = CustomerCK.create
    expect(c).to be
  end
end
