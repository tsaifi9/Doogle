require 'spec_helper'

describe Word do
  context "associations" do
    it { should have_many(:definitions).dependent(:destroy) }
  end

  context "validations" do
    let(:unallowed_words) {["word1", "word!", "word+" "word,", "!@#$^%*&^()+1234567890~`\""]}
    let(:allowed_words) { ["word", "ice skate", "ice-skate", "I'm"] }

    it { should validate_presence_of :value } }

    it "should validate characters" do
      allowed_words.each { |word| should allow_value(word).for(:value) }
      unallowed_words.each { |word| should_not allow_value(word).for(:value) }
    end

  end

  context "get_definition" do
    let!(:word_with_single_definition) { create(:word_with_single_definition) }
    let!(:word_with_multiple_definitions) { create(:word_with_multiple_definitions) }

    it "returns the definitions" do
      word = Word.new(value: "single_definition")

      #single definition (call to db)
      definition = word.get_definitions
      expect(definition.length).to eq(1)
      expect(definition).to eq(word_with_single_definition.definitions.map { |x| x.text })

      #multiple definitions (call to db)
      word.value = "multiple_definitions"
      definitions = word.get_definitions
      expect(definitions.length).to eq(2)
      expect(definitions).to eq(word_with_multiple_definitions.definitions.map { |x| x.text })

      #call to external (stubbed api)

      #no definition
      word.value = "does_not_exist"
      expect(word.get_definitions).to eq(["stubbed definition"])
    end
  end
end
