class CreateWatchlistCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlist_coins do |t|
      t.references :coin, null: false, foreign_key: true
      t.references :wathlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
