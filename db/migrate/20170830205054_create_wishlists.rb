class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.string :title
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
