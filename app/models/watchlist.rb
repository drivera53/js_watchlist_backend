class Watchlist < ApplicationRecord
    has_many :watchlist_coins
    has_many :coins, through: :watchlist_coins
end
