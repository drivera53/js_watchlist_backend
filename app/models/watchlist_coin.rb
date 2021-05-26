class WatchlistCoin < ApplicationRecord
  belongs_to :coin
  belongs_to :watchlist

  validates :coin_id, presence: true
  validates :watchlist_id, presence: true
end