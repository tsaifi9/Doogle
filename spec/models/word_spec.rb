require 'spec_helper'

describe Word do
  context "associations" do
    it { should have_many(:definitions).dependent(:destroy) }
  end

  context "validations" do
    let(:unallowed_words) {["word1", "word!", "word+" "word,", "!@#$^%*&^()+1234567890~`\""]}
    let(:allowed_words) { ["word", "ice skate", "ice-skate", "I'm"] }

    it { should validate_presence_of :word }

    it "should validate characters" do
      allowed_words.each { |word| should allow_value(word).for(:word) }
      unallowed_words.each { |word| should_not allow_value(word).for(:word) }
    end

  end

  context "get_definition" do
    let!(:word_with_single_definition) { create(:word_with_single_definition) }
    let!(:word_with_multiple_definitions) { create(:word_with_multiple_definitions) }

    it "returns the definitions" do
      word = Word.new(word: "single_definition")

      #single definition (call to db)
      definition = word.get_definitions
      expect(definition.length).to eq(1)
      expect(definition).to eq(word_with_single_definition.definitions.map { |x| x.text })

      #multiple definitions (call to db)
      word.word = "multiple_definitions"
      definitions = word.get_definitions
      expect(definitions.length).to eq(2)
      expect(definitions).to eq(word_with_multiple_definitions.definitions.map { |x| x.text })

      #call to external (stubbed api)
      word.word = "stubbed"
      expect(word.get_definitions).to eq(["stubbed definition"])

      #no definition
      word.word = "dne"
      expect(word.get_definitions).to eq(["Definition not found"])
    end
  end
end
