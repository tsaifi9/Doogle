# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Word.create(word: "seed")
Definition.create(text: "created froms seeds.rb", word_id: 1)
Definition.create(text: "Another one created froms seeds.rb", word_id: 1)
