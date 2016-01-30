class Game < ActiveRecord::Base
  has_many :minions
  has_many :game_words

  def encrypt_string
    count = 0
    encrypted = ""
    self.game_words.each do |game_word|
      count += game_word.word.name.length
    end

    count.times do |i|
      self.game_words.each do |game_word|
        if i < game_word.word.name.length
          encrypted += game_word.word.name[i].to_s
        end
      end
    end
    encrypted
  end

  def solution_percentage(player_solution)
      good = 0
      bad = 0

      correct_solution = self.encrypt_string
      return 100.0 if correct_solution == player_solution

      correct_solution.split('').each.with_index do |character, i|
        if i < player_solution.length
          if correct_solution[i] == player_solution[i]
            good += 1
          end
        end
      end

      if correct_solution.length < player_solution.length
        good -= player_solution.length - correct_solution.length
      end
      (good * 100.0) / correct_solution.length
  end
end
