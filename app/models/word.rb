require 'webservices/merriam_webster'

class Word < ActiveRecord::Base
  has_many :definitions, dependent: :destroy

  #allow only characters, -, space, and '
  validates :word, presence: true, format: { without: /[^a-zA-z\-'\s]/ }

  def get_definitions
    word_in_database = Word.find_by(word: word)
    return word_in_database.definitions.map{ |definition| definition.text } unless word_in_database.nil?

    definitions_from_merriam_webster = WebServices::MerriamWebster.get_definitions(word)

    #save in database for lazy loading
    saved_word = Word.create(word: word)
    definitions_from_merriam_webster.each { |definition| Definition.create(text: definition, word: saved_word) }
  end
end
