require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'should see a sign in link and a sign up link' do
      visit '/videos'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'should not see sign out link' do
      visit '/videos'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in and on homepage' do
    before(:each) do
      user = create(:user)
      visit '/videos'
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario 'should see sign out link' do
      visit '/videos'
      expect(page).to have_link 'Sign out'
    end

    scenario 'should not see sign in or sign up links' do
      visit '/videos'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end