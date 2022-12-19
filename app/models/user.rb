class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attribute :prowess, :string, default: "未設定"

  validates :name, { presence: true, length: { maximum: 20 } }
  validates :rank, { numericality: true, allow_nil: true }
  validates :prowess, { presence: true }
  validates :profile, { length: { maximum: 100 } }

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲスト"
      user.rank = "99"
      user.prowess = "S+"
      user.profile = "ゲストログイン用のアカウントです。"
    end
  end

  def already_favorited?(post)
    favorites.exists?(post_id: post.id)
  end
end
