Rails.application.routes.draw do
  root 'game#index'
  get '/new', to: 'game#new'
  get '/computer_move', to: 'game#computer_move'
end
