class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.date :date
      t.string :block
      t.string :crime_type
      t.string :description
      t.string :location_type
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
