class MinionsController < ApplicationController
  def new
    @game = Game.find params[:id]
    @minions_quantity= @game.minions_quantity
  end

  def create
    #NO TIENE VISTA!
    names = params[:names]
    game= Game.find params[:id]

    minions_count = Minion.where(game_id: game).count

    names.length.times do |i|
      active_game_word=GameWord.create(game:game, word:Word.get_random_record)
      minion = Minion.find_by name:names[i.to_s]
      if minions_count < game.minions_quantity
        minion = Minion.new unless minion
      end

      if minion
        minion.name = names[i.to_s]
        minion.game = game
        minion.game_word = active_game_word
        minion.position = i+1
        minion.save
      end
    end

    redirect_to game_links_path(game)
  end

  def show
    @minion=Minion.find params[:id]
    @fake_words=[]
    @fake_words << Word.get_random_record_without(@minion.game_word.word.name)
    @fake_words << Word.get_random_record_without(@minion.game_word.word.name)
  end
end
