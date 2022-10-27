class AddAbbreviationToGearPowers < ActiveRecord::Migration[6.1]
  def change
    add_column :gear_powers, :abbreviation, :string
  end
end
