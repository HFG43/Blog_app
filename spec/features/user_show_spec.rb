require 'rails_helper'

describe "Viewing show user page", type: :feature do
  before :each do
    @user = User.create(name: 'David Gilmour', photo: 'https://i.pravatar.cc/200?img=04%02',
                        bio: 'Guitar god!')
  end
  
  it "should display the user's profile picture" do
    visit user_path(@user)
    expect(page).to have_css("img[src*='https://i.pravatar.cc/200?img=04%02']")
  end

  it "should display the user's username" do
    visit user_path(@user)
    expect(page).to have_content 'David Gilmour'
  end

  it 'should display the number of posts written' do
    Post.create(author: @user, title: 'Testing 1', text: 'Testing test 1')
    Post.create(author: @user, title: 'Testing 2', text: 'Testing test 2')
    Post.create(author: @user, title: 'Testing 3', text: 'Testing test 3')

    visit user_path(@user)
    expect(@user.posts_counter).to eq(3)
  end

  it "should display the user's bio" do
    visit user_path(@user)
    expect(page).to have_content 'Guitar god!'
  end

  it "should show the last three posts" do
    Post.create(author: @user, title: 'First', text: 'Post body 1')
    Post.create(author: @user, title: 'Second', text: 'Post body 2')
    Post.create(author: @user, title: 'Third', text: 'Post body 3')
    Post.create(author: @user, title: 'Fourth', text: 'Post body 4')
    visit user_path(@user)
    
    expect(page).to have_content('Post body 4')

    expect(page).not_to have_content('Post body 1')
  end  

  it "should display a link to see all user's posts" do
    visit user_path(@user)
    expect(page).to have_link 'See all post'
  end

  it "should redirect to post's show page when clicking on the post" do
    fourth_post = Post.create(author: @user, title: 'Fourth', text: 'Post body 4')
    visit user_path(@user)

    click_link 'Fourth'
    expect(current_path).to eq(user_post_path(@user, fourth_post.id))
  end

  it "should redirect to user's index page when clicking on see all posts" do
    visit user_path(@user)

    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(@user))
  end
end