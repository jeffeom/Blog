class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :posts_comments, through: :posts, source: :comments
  has_many :favourites, dependent: :nullify
  has_many :favourite_posts, through: :favourites, source: :post


end
