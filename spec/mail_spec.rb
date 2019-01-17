require_relative '../lib/mail.rb'

describe "mails" do
  it "didn't find the right mail" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/arnouville-les-gonesse.html")).to eq("webmaster@villedarnouville.com")
  end
end

describe "method perform" do
  it "not the good amount" do
    expect(perform.size).to eq(185)
  end
end