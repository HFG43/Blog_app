require 'rails_helper'

describe "Viewing show post page", type: :feature do
  before :each do
    @user = User.create(name: 'Eddie Van Halen', photo: 'https://i.pravatar.cc/200?img=05%02',
                        bio: 'Greatest guitar player!')
    @post = Post.create(author: @user, title: 'First', text: 'Post body 1')
  end

  it 'should display the post title' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('First')
  end

  it "should display the author's name" do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Eddie Van Halen')
  end

  it "should display how many comments the post has" do
    Comment.create(post: @post, author: @user, text: 'Comment 1')
    Comment.create(post: @post, author: @user, text: 'Comment 2')
    Comment.create(post: @post, author: @user, text: 'Comment 3')
 
    visit user_post_path(@user, @post)
    expect(@post.comments_counter).to eq(3)
  end

  it "should display how many likes the post has" do
    Like.create(post: @post, author: @user)
    visit user_post_path(@user, @post)
    expect(@post.likes_counter).to eq(1)
  end

  it "should display the post body" do
    visit user_post_path(@user, @post)
    expect(page).to have_content 'Post body 1'
  end

  it "should display the name of each commentor" do
    user_commenter = User.create(name: 'Mike', bio: 'Oldfield')
    Comment.create(post: @post, author: user_commenter, text: 'Comment 1')

    visit user_post_path(@user, @post)
    expect(page).to have_content 'Mike'
  end

  it "should display the each comment" do
    user_commenter = User.create(name: 'Mike', bio: 'Oldfield')
    Comment.create(post: @post, author: user_commenter, text: 'Comment 1')
    
    visit user_post_path(@user, @post)
    expect(page).to have_content 'Comment 1'
  end
end  