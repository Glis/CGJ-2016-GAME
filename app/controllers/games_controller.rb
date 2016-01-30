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
    @game = Game.find params[:id]
  end

  def show

  end

  def results

  end

end
