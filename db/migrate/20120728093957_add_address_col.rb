class AddAddressCol < ActiveRecord::Migration
  def self.up
      add_column :crimes, :address, :string
    end

    def self.down
      remove_column :crimes, :address
    end
end
