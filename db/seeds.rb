# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

words = Faker::Lorem.words(50)
words.each do |word|
  Word.create name:word
end

word1 = Word.all[2]
word2 = Word.all[10]
word3 = Word.all[5]

game = Game.create

game_word = GameWord.new
game_word.game = game
game_word.word = word1
game_word.save

game_word = GameWord.new
game_word.game = game
game_word.word = word2
game_word.save

game_word = GameWord.new
game_word.game = game
game_word.word = word3
game_word.save
