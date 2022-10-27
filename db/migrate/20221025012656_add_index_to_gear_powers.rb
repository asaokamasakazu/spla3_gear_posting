class AddIndexToGearPowers < ActiveRecord::Migration[6.1]
  def change
    add_index :gear_powers, :name, unique: true
    add_index :gear_powers, :effect, unique: true
  end
end
