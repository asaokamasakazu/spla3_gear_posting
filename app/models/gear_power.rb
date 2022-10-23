class GearPower < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  validates :effect, {presence: true, uniqueness: true}
  validates :main_part, {presence: true}
  validates :abbreviation, {presence: true}
end
