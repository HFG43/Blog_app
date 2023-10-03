require 'rails_helper'

describe "Viewing index post page", type: :feature do
  before :each do
    @user = User.create(name: 'David Gilmour', photo: 'https://i.pravatar.cc/200?img=04%02',
                        bio: 'Guitar god!')
  end

  it 'should display the users photo' do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src*='https://i.pravatar.cc/200?img=04%02']")
  end

  it 'should display the users username' do
    visit user_posts_path(@user)
    expect(page).to have_content 'David Gilmour'
  end

  it 'should display the number of posts written' do
    Post.create(author: @user, title: 'Testing 1', text: 'Testing test 1')
    Post.create(author: @user, title: 'Testing 2', text: 'Testing test 2')

    visit user_posts_path(@user)
    expect(@user.posts_counter).to eq(2)
  end
end  