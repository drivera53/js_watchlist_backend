class Watchlist < ApplicationRecord
    has_many :watchlist_coins
    has_many :coins, through: :watchlist_coins

    validates :name, presence: true
    validates :description, presence: true
    def created_at
        attributes['created_at'].strftime("%m/%d/%Y %H:%M")
    end
end
