class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, { presence: true, length: { maximum: 20 } }
  validates :rank, { numericality: true, allow_nil: true }
  validates :profile, { length: { maximum: 100 } }

  has_one_attached :image
end
