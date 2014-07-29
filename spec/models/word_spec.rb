require 'spec_helper'

describe Word do
  context "associations" do
    it { should have_many(:definitions).dependent(:destroy) }
  end

  context "validations" do
    it { should validate_presence_of :value }
    it { should_not allow_value("word with spaces").for(:value) }
  end

  context "get_definition" do
    let!(:word_with_single_definition) { create(:word_with_single_definition) }
    let!(:word_with_multiple_definitions) { create(:word_with_multiple_definitions) }

    it "returns the definitions" do
      #single definition
      definition = Word.get_definitions("single_definition")
      expect(definition.length).to eq(1)
      expect(Word.get_definitions("single_definition")).to eq(word_with_single_definition.definitions.map { |x| x.text })

      #multiple definitions
      definitions = Word.get_definitions("multiple_definitions")
      expect(definitions.length).to eq(2)
      expect(definitions).to eq(word_with_multiple_definitions.definitions.map { |x| x.text })

      #no definition
      expect(Word.get_definitions("does_not_exist")).to eq(["Definition not found"])
    end
  end
end
