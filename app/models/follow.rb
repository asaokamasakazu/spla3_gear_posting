class Follow < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates_uniqueness_of :follower_id, scope: :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
