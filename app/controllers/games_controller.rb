class GamesController < ApplicationController
  def welcome

  end

  def new
    
  end

  def create
    game = Game.create points:0

    redirect_to minion_new_path(game, quantity:params[:quantity])
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
