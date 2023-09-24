class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id_id'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter
  after_destroy :update_post_counter

  def update_post_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
