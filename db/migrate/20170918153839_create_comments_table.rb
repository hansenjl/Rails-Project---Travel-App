class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments_tables do |t|
      t.integer :user_id
      t.integer :city_id
      t.string :text
      t.timestamps
    end
  end
end
