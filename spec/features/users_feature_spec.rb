require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'should see a sign in link and a sign up link' do
      visit '/videos'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'should not see sign out link' do
      visit '/videos'
      expect(page).not_to have_link('Sign out')
    end
  end
end