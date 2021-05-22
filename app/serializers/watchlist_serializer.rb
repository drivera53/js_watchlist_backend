class WatchlistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  has_many :coins
end

# t.string "name"
# t.string "description"
