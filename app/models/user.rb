class User < ActiveRecord::Base
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :posts_comments, through: :posts, source: :comments
end
