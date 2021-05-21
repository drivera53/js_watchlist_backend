class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :coin_api_id
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end