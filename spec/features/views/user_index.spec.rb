require 'rails_helper'

describe "Viewing index users page", type: :feature do
  before :each do
    @first_user = User.create(name: 'Eddie Van Halen', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Greatest guitar player!')
    @second_user = User.create(name: 'Keith Moon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Best drummer!')
  end
  
  it 'should display the username of all users' do
    visit users_path
    expect(page).to have_content('Eddie Van Halen')
    expect(page).to have_content('Keith Moon')
  end
end