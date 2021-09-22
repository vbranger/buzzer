class BuzzsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @game = Game.find(params[:game_id])
    @buzz = Buzz.new(buzzs_params)
    @buzz.game = @game
    @buzz.user = current_user
    if @buzz.save
      GameChannel.broadcast_to(
        @game,
        render_to_string(partial: "buzz", locals: { buzz: @buzz })
      )
      BuzzerChannel.broadcast_to(
        @game,
        render_to_string(
          partial: "shared/buzzer", 
          locals: { 
            game: @game, 
            buzzed: true, 
            buzzer: 'locked', 
            first_user_id: current_user.id 
          }
        )
      )
      # redirect_to game_path(@game, anchor: "buzz-#{@buzz.id}")
    else
      render "games/show"
    end
  end

  def clearbuzzs
    @buzzs = Buzz.destroy_all
    @game = Game.find(params[:game_id])

    BuzzerChannel.broadcast_to(
      @game,
      render_to_string(partial: "shared/buzzer", locals: { game: @game, buzzed: false })
    )

    redirect_to game_path(@game)
  end

  private

  def buzzs_params
    params.require(:buzz).permit(:buzzed, :game_id)
  end

end
