class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @buzz = Buzz.new
  end

  def create
    @game = Game.new
    @game.user_id = current_user.id
    @game.number = @game.id
    @game.save

    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:number, :user_id)
  end
end
