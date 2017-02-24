class ParticipationsController < ApplicationController

  def index
    @participations = Participation.all
  end

  def new
   @participation = Participation.new
  end

  private def participation_params
    params[:participation].permit(
      :id,
      :user_id,
      :plan_item_id
    )
  end
end
