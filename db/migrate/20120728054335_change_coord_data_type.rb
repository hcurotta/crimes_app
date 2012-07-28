class ChangeCoordDataType < ActiveRecord::Migration
  def up
    change_table :crimes do |t|
       t.change :longitude, :decimal, :precision => 9, :scale => 6
       t.change :latitude, :decimal, :precision => 9, :scale => 6
    end
  end

  def down
    change_table :crimes do |t|
      t.change :longitude, :integer
      t.change :latitude, :integer
    end
  end
end
