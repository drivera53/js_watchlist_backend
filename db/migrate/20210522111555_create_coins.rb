class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :coin_api_id
      t.string :name
      t.string :symbol
      t.decimal :current_price
      t.decimal :price_change_percentage_1h_in_currency
      t.decimal :high_24h
      t.decimal :low_24h
      t.decimal :total_volume
      t.decimal :market_cap
      t.decimal :market_cap_rank
      t.decimal :circulating_supply
      t.timestamps
    end
  end
end
