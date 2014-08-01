require 'spec_helper'
require 'webservices/merriam_webster'

describe WebServices::MerriamWebster do
  it "gets a definition" do
    expect(WebServices::MerriamWebster.get_definitions("sdfsf")).to eq(["stubbed definition"])
  end
end