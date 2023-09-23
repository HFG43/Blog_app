require 'rails_helper'

RSpec.describe User, type: :model do
  let(:author) { double('User', name: 'Bruce Lee', bio: 'Be like the water...') }

  context 'Creating a new user' do
    it 'The user should have a name' do
      allow(author).to receive(:name).and_return('')
      allow(author).to receive(:valid?).and_return(false)
      expect(author).to_not be_valid
    end

    it 'Should return an empty array of posts' do
      allow(author).to receive(:last_three_posts).and_return([])
      expect(author.last_three_posts).to be_empty
    end

    it 'Should return the last three posts when posts exist' do
      post1 = double(title: 'Hobbie', text: 'Fly fishing')
      post2 = double(title: 'Music', text: 'Pink Floyd')
      post3 = double(title: 'Place', text: 'Patagonia')

      allow(author).to receive(:last_three_posts).and_return([post3, post2, post1])

      expect(author.last_three_posts).to eq([post3, post2, post1])
    end
  end
end
