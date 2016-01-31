class GamesController < ApplicationController
  def welcome

  end

  def new

  end

  def create
    game = Game.create points:0, minions_quantity: params[:quantity]

    redirect_to minion_new_path game
    #NO TIENE VISTA!
  end

  def get_links
    @tutorial_message = "Write 'start' to begin the game"
    @game = Game.find params[:id]
  end

  def show
    @game = Game.find params[:id]
  end

  def results
    @game = Game.find params[:id]
    @player_solution = params[:spell]
  end

end
