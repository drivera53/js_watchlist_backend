# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Testing data

# Creating coins
coin_a = Coin.create(coin_api_id: "bitgesell", name: "Bitgesell", symbol: "bgl")
coin_b = Coin.create(coin_api_id: "bitget-defi-token", name: "Bitget DeFi Token", symbol: "bft")
coin_c = Coin.create(coin_api_id: "bitgrin", name: "BitGrin", symbol: "xbg")
coin_d = Coin.create(coin_api_id: "bitguild", name: "BitGuild PLAT", symbol: "plat")
coin_e = Coin.create(coin_api_id: "bithachi", name: "Bithachi", symbol: "bith")

# Creating watchlists
watchlist_a = Watchlist.create(name: "Top 20", description: "Top 20 coins by market cap")
watchlist_b = Watchlist.create(name: "Most searched", description: "Most searched coins in the last 24hrs")

# Creating watchlist_coins 
watchlist_coins_a = WatchlistCoin.create(coin: coin_a, watchlist: watchlist_a)
watchlist_coins_b = WatchlistCoin.create(coin: coin_b, watchlist: watchlist_b)
watchlist_coins_c = WatchlistCoin.create(coin: coin_c, watchlist: watchlist_a)
watchlist_coins_d = WatchlistCoin.create(coin: coin_d, watchlist: watchlist_b)
watchlist_coins_e = WatchlistCoin.create(coin: coin_e, watchlist: watchlist_a)
watchlist_coins_f = WatchlistCoin.create(coin: coin_a, watchlist: watchlist_b)
