class AddAvgRatingColumnToCitiesTable < ActiveRecord::Migration[5.1]
  def change
     add_column :cities, :avg_rating, :float
  end
end
