class MinionsController < ApplicationController
  def new
    @game = Game.find params[:id]

    @minions_quantity= params[:quantity].to_i
  end

  def create

    #NO TIENE VISTA!
  end

  def show
  end
end
