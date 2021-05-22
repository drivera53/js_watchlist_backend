class CoinSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :coin_api_id, :symbol, :current_price, :price_change_percentage_1h_in_currency, :high_24h, :low_24h, :total_volume, :market_cap, :market_cap_rank, :circulating_supply  
  has_many :watchlists 
end