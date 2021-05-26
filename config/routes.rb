Rails.application.routes.draw do
  delete '/watchlist_coins/special_delete/:coin_id/:watchlist_id', to: "watchlist_coins#special_delete"

  resources :watchlist_coins
  resources :watchlists
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
