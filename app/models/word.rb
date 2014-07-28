class Word < ActiveRecord::Base
  has_many :definitions


  # Gets the defintiion of a word. If the word exists, it will be taken from the database
  # If the word does not exist in the db, a call is made to the merriam-webster api to get it
  # word is then saved if call is made to api
  # If the words does not exist in either place, returns "Not found"
  # Params:
  # +word+:: word to search for
  def self.get_definition(word)

  end
end
