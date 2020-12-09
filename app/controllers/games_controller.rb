class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @buzz = Buzz.new
  end
end
