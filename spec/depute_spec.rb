require_relative '../lib/depute.rb'

describe "searching for the amount of urls" do
  it "didn't find the right amount" do
    expect(get_depute_urls[1].size).to eq(577)
  end
end

describe "find a mail" do
  it "wrong mail" do
    expect(get_depute_email("https://www.nosdeputes.fr/berangere-abba")).to eq("berangere.abba@assemblee-nationale.fr")
  end
end