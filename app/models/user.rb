class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'

  validates :name, presence: true

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def has_liked?(post)
    likes.where(post: post).exists?
  end
  
  def last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
