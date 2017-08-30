class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :city_id
      t.text :comment

      t.timestamps
    end
  end
end
