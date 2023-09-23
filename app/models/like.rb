class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create :update_likes_counter
  after_destroy :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
