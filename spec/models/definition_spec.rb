require 'spec_helper'

describe Definition do
  describe "associations" do
    it { should belong_to(:word) }
  end
end