require 'rest_client'

class Word < ActiveRecord::Base
  has_many :definitions, dependent: :destroy

  validates :value, presence: true, format: { without: /[^a-zA-z\-'\s]/ }

  def self.get_definitions(word)
    word = Word.find_by(value: word)
    return word.definitions.map{ |definition| definition.text } unless word.nil?



    ["Definition not found"]
  end
end
