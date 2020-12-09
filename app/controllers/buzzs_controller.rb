class BuzzsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @game = Game.find(params[:game_id])
    @buzz = Buzz.new(buzzs_params)
    @buzz.game = @game
    @buzz.user = current_user
    if @buzz.save
      redirect_to game_path(@game, anchor: "buzz-#{@buzz.id}")
    else
      render "games/show"
    end
  end

  private

  def buzzs_params
    params.require(:buzz).permit(:buzzed, :game_id)
  end

end
