class CreateGearPowers < ActiveRecord::Migration[6.1]
  def change
    create_table :gear_powers do |t|
      t.string :name
      t.string :effect
      t.string :easy_brand1
      t.string :easy_brand2
      t.string :hard_brand1
      t.string :hard_brand2
      t.string :main_part

      t.timestamps
    end
  end
end
