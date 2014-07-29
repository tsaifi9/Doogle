FactoryGirl.define do

  factory :definition do
    text "some definition"
    word
  end

  factory :word do
    value "word"

    factory :word_with_single_definition do
      value "single_definition"
      after(:create) do |word, _|
        create_list(:definition, 1, word: word)
      end
    end

    factory :word_with_multiple_definitions do
      value "multiple_definitions"
      after(:create) do |word, _|
        create_list(:definition, 2, word: word)
      end
    end
  end
end