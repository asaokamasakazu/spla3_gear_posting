class Post < ApplicationRecord
  validates :title, { presence: true, length: { maximum: 20 } }
  validates :weapon, { presence: true }
  validates :battle, { presence: true }
  validates :comment, { length: { maximum: 250 } }
  validates :head_main, { presence: true }
  validates :head_sub1, { presence: true }
  validates :head_sub2, { presence: true }
  validates :head_sub3, { presence: true }
  validates :body_main, { presence: true }
  validates :body_sub1, { presence: true }
  validates :body_sub2, { presence: true }
  validates :body_sub3, { presence: true }
  validates :shoes_main, { presence: true }
  validates :shoes_sub1, { presence: true }
  validates :shoes_sub2, { presence: true }
  validates :shoes_sub3, { presence: true }

  belongs_to :user
end
