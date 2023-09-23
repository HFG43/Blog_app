require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Bruce Lee', bio: 'Be like the water...') }
  let(:post) { Post.new(author: user, title: 'Hobbie', text: 'Fly fishing', comments_counter: 0, likes_counter: 0) }

  context 'Adding a new Post without saving it' do
    it 'Should have a title' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'Title should have a maximum length of 250' do
      post.title = '
      Fly fishing is an angling method that uses a light-weight lure—called
      an artificial fly—to catch fish. The fly is cast using a fly rod, reel,
      and specialized weighted line. The light weight requires casting techniques
      significantly different from other forms of casting.
      Fly fishing is an angling method that uses a light-weight lure—called
      an artificial fly—to catch fish. The fly is cast using a fly rod, reel,
      and specialized weighted line. The light weight requires casting techniques
      significantly different from other forms of casting.
      '
      expect(post).to_not be_valid
    end

    it 'At start recent comments should be empty' do
      expect(post.recent_comments).to be_empty
    end

    it 'Like and comment counters should be integers should be integers' do
      expect(post.comments_counter).to be_an_instance_of(Integer)
      expect(post.likes_counter).to be_an_instance_of(Integer)
    end

    it 'Counters should be zero at init' do
      expect(post.comments_counter).to eq(0)
      expect(post.likes_counter).to eq(0)
    end
  end
end
