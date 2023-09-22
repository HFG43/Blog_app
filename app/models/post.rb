class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_post_counter
  after_destroy :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
  
  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end  
end
