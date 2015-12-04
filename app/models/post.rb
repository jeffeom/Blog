class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :nullify

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
