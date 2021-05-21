class Coin < ApplicationRecord
    has_many :watchlist_coins
    has_many :watchlists, through: :watchlist_coins
end
