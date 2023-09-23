class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true

  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
