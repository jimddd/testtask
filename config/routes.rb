Rails.application.routes.draw do
  get 'poker/leaderboard/:event_id', to: 'poker#leaderboard'
end
