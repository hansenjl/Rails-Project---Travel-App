class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :city_id
      t.integer :user_id
      t.integer :city_rating

      t.timestamps
    end
  end
end
