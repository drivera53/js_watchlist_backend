class CoinSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :coin_api_id, :symbol
  has_many :watchlists 
end
