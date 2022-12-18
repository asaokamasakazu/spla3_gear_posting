class Contact < ApplicationRecord
  validates :name, { presence: true, length: { maximum: 20 } }
  validates :message, { presence: true, length: { maximum: 1000 } }
end
