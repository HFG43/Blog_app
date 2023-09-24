require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Hernan', bio: 'I am a backend lover') }
  let(:post) { Post.create(author: user, title: 'My test', text: 'This is a test') }

  describe '#update_comment_counter' do
    it 'should return true when creating a comment' do
      commenter = User.create(name: 'Commenter', bio: 'I love commenting')
      comment = Comment.new(user: commenter, post: post, text: 'This is a comment')

      expect(comment.save).to be true
    end
  end
end
