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
    @game = Game.find params[:id]
  end

  def results
    @game = Game.find params[:id]
    @player_solution = params[:spell]
  end

  def show_joins
    code = params[:code]
    if code.blank?
      redirect_to :back
    else
      if Minion.where({id:code}).length > 0
        min = Minion.find code
        if min.game
          redirect_to minion_show_path code
        else
          redirect_to :back
        end
      else
        redirect_to :back
      end
    end
  end

end
