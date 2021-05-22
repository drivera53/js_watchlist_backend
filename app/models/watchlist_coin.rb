class WatchlistCoin < ApplicationRecord
  belongs_to :coin
  belongs_to :watchlist
end
