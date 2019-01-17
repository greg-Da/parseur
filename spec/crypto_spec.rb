require_relative '../lib/crypto.rb'

describe "method currency" do
  it "not the good amount" do
    expect(currency.size).to eq(2109)
  end
end