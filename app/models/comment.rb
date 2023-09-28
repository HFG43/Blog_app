class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'posts_id'

  after_create :update_comment_counter
  after_destroy :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
