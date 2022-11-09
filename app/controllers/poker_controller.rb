class PokerController < ApplicationController
  def leaderboard
    @event = Event.find(params[:event_id])
  end
end
