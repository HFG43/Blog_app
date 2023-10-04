require 'rails_helper'

describe 'Viewing index post page', type: :feature do
  before :each do
    @user = User.create(name: 'David Gilmour', photo: 'https://i.pravatar.cc/200?img=04%02',
                        bio: 'Guitar god!')
  end

  it "should display the user's photo" do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src*='https://i.pravatar.cc/200?img=04%02']")
  end

  it "should display the user's username" do
    visit user_posts_path(@user)
    expect(page).to have_content 'David Gilmour'
  end

  it 'should display the number of posts written' do
    Post.create(author: @user, title: 'Testing 1', text: 'Testing test 1')
    Post.create(author: @user, title: 'Testing 2', text: 'Testing test 2')

    visit user_posts_path(@user)
    expect(@user.posts_counter).to eq(2)
  end

  it 'should display the post title' do
    Post.create(author: @user, title: 'Testing 3', text: 'Testing test 3')

    visit user_posts_path(@user)
    expect(page).to have_content 'Testing 3'
  end

  it 'should display the post body' do
    Post.create(author: @user, title: 'Testing 4', text: 'Testing the body text, the body text, the body text...')

    visit user_posts_path(@user)
    expect(page).to have_content 'the body text, the'
  end

  it 'should display the first comment on a post' do
    Post.create(author: @user, title: 'First post', text: 'Testing the first post')

    visit user_posts_path(@user)
    expect(page).to have_content 'Testing the first post'
  end

  it 'should display how many comments the post has' do
    second_post = Post.create(author: @user, title: 'Second post', text: 'Testing comments')
    Comment.create(post: second_post, author: @user, text: 'Comment 1')
    Comment.create(post: second_post, author: @user, text: 'Comment 2')
    Comment.create(post: second_post, author: @user, text: 'Comment 3')
    Comment.create(post: second_post, author: @user, text: 'Comment 4')

    visit user_posts_path(@user)
    expect(second_post.comments_counter).to eq(4)
  end

  it 'should display how many likes the post has' do
    third_post = Post.create(author: @user, title: 'Second post', text: 'Testing likes')
    Like.create(post: third_post, author: @user)

    visit user_posts_path(@user)
    expect(third_post.likes_counter).to eq(1)
  end

  it 'should display pagination' do
    Post.create(author: @user, title: 'First', text: 'Post body 1')
    Post.create(author: @user, title: 'Second', text: 'Post body 2')
    Post.create(author: @user, title: 'Third', text: 'Post body 3')
    Post.create(author: @user, title: 'Fourth', text: 'Post body 4')

    visit user_posts_path(@user)

    expect(page).to have_content('Pagination')
  end

  it "should redirect create a new post, if you click 'Create a New Post!' button" do
    visit users_path

    click_link 'Create a New Post!'
    expect(current_path).to eq(new_user_post_path(@user))
  end
end
