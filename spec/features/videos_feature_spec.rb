require 'rails_helper'

feature 'videos' do
  context 'no videos have been added' do
    scenario 'should add a prompt to add a video' do
      visit '/videos'
      expect(page).to have_content 'No videos added yet...'
      expect(page).to have_link 'Add a video'
    end
  end
end