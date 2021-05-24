class Watchlist < ApplicationRecord
    has_many :watchlist_coins
    has_many :coins, through: :watchlist_coins

    validates :name, presence: true
    validates :description, presence: true
end
