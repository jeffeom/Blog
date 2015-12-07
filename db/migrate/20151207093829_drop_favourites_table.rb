class DropFavouritesTable < ActiveRecord::Migration
  def change
    drop_table :favourites do |t|
      t.integer :user_id
      t.string :post
      t.string :references
      t.timestamps
    end
  end
end
