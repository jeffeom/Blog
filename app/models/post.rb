class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :nullify
  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  def favourited_by?(user)
    favourite_for(user).present?
  end

  def favourite_for(user)
    favourites.find_by_user_id user.id
  end
end
