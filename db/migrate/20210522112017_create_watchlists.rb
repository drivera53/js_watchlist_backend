class CreateWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlists do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
