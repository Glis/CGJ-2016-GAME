class MinionsController < ApplicationController
  def new
    @game = Game.find params[:id]

    @minions_quantity= params[:quantity].to_i
  end

  def create
    #NO TIENE VISTA!
    names = params[:names]
    game= Game.find params[:id]

    minions=[]

    names.length.times do |i|
      active_game_word=GameWord.create(game:game, word:Word.get_random_record)
      minions << Minion.create(name:names[i.to_s], game:game, game_word:active_game_word, position:i+1)
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
