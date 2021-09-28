class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @buzz = Buzz.new
    @players = ActionCable.server.connections.length
    @buzzed = buzzed?
    @buzzer_status = buzzed? ? 'lock' : 'open'
  end

  def create
    @game = Game.new
    @game.user_id = current_user.id
    @game.number = @game.id
    @game.save

    redirect_to game_path(@game)
  end

  def index
    @games = Game.all
    @game = Game.new
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end

  def find
    unless params[:search] == ""
      @game = Game.find(params[:search])
      redirect_to game_path(@game)
    else
      redirect_to root_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:number, :user_id)
  end

  def buzzed?
    if Buzz.count == 0
      return false
    else
      return true
    end
    
  end
end
