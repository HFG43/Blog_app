# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   # describe "after_create and after_destroy hooks" do
#     let!(:user) { User.create(name: 'Bruce Lee', bio: 'Be like the water...') }
#     let!(:post) { Post.create(author: user, title: 'Hobbie', text: 'Fly fishing') }  # Utiliza let! para crear el objeto Post en la base de datos
#     let(:comment) { Comment.new(user:, post:, text: 'Hi, what a great test!') }  # Utiliza el objeto Post real

#     context 'After saving the user and post' do
#       before do
#         user.save
#         post.save
#         comment.save
#       end

#       it 'Should reference the user id' do
#         expect(comment.user_id).to eq(user.id)
#       end

#       it 'Should reference the post id' do
#         expect(comment.post_id).to eq(post.id)
#       end

#       it 'The comments counter should be 1' do
#         post.reload
#         expect(post.comments_counter).to eq(1)
#       end

#       after do
#         user.reload
#         post.reload
#         comment.destroy
#         post.destroy
#         user.destroy
#       end
#     end
#   end
