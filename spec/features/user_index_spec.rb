require 'rails_helper'

describe "Viewing index users page", type: :feature do
  before :each do
    @first_user = User.create(name: 'Eddie Van Halen', photo: 'https://i.pravatar.cc/200?img=05%02',
                          bio: 'Greatest guitar player!')
    @second_user = User.create(name: 'Keith Moon', photo: 'https://i.pravatar.cc/200?img=06%02',
                          bio: 'Best drummer!')
  end

  it 'should display the profile picture of each user' do
    visit users_path
    expect(page).to have_css("img[src*='https://i.pravatar.cc/200?img=05%02']")
    expect(page).to have_css("img[src*='https://i.pravatar.cc/200?img=06%02']")
  end

  it 'should display the name of all users' do
    visit users_path
    expect(page).to have_content('Eddie Van Halen')
    expect(page).to have_content('Keith Moon')
  end

  it 'should display the number of posts each user has written' do
    Post.create(author: @first_user, title: 'Testing 1', text: 'Testing test 1')
    Post.create(author: @first_user, title: 'Testing 2', text: 'Testing test 2')
    Post.create(author: @first_user, title: 'Testing 3', text: 'Testing test 3')
    Post.create(author: @second_user, title: 'Testing 4', text: 'Testing test 4')

    visit users_path
    expect(@first_user.posts_counter).to eq(3)
    expect(@second_user.posts_counter).to eq(1)
  end

  it "should redirect to user's show page when clicking on the user" do
    visit users_path

    click_link 'Keith Moon'
    expect(current_path).to eq(user_path(@second_user))
  end
end