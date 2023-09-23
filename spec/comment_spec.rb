require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @author = User.create(name: 'Hernan', bio: 'I am a backend lover')
    @post = Post.create(author_id: @author.id, title: 'My test', text: 'This is a test')
  end

  describe '#update_comment_counter' do
    it 'should return true when creating a comment' do
      user = User.create(name: 'Commenter', bio: 'I love commenting')
      comment = Comment.new(user:, post: @post, text: 'This is a comment')

      expect(comment.save).to be true
    end
  end
end
