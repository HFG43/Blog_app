require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.create(name: 'Hernan', bio: 'I am a backend lover')
    @post = Post.create(author_id: @author.id, title: 'My test', text: 'This is a test')
  end

  describe '#update_likes_counter_by_post' do
    it 'should test the likes_counter ' do
      like_author = User.create(name: 'Hernan', bio: 'I am practicing Rails')

      first_like = Like.new(post: @post, user: like_author)
      expect(first_like.save).to be true

      second_like = Like.new(post: @post, user: like_author)
      expect(second_like.save).to be true
    end
  end
end
