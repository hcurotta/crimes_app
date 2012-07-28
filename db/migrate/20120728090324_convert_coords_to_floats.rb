class ConvertCoordsToFloats < ActiveRecord::Migration
  def up
    change_table :crimes do |t|
       t.change :longitude, :float
       t.change :latitude, :float
     end
  end

  def down
      change_table :crimes do |t|
         t.change :longitude, :decimal, :precision => 9, :scale => 6
         t.change :latitude, :decimal, :precision => 9, :scale => 6
       end
       
  end
end
