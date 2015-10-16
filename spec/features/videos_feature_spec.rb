require 'rails_helper'

feature 'videos' do
  context 'no videos have been added' do
    scenario 'should add a prompt to add a video' do
      visit '/videos'
      expect(page).to have_content 'No videos added yet...'
      expect(page).to have_link 'Add a video'
    end
  end

  context 'videos have been added' do
    before do
      Video.create(link: 'https://youtu.be/gId4LfQMqbQ')
    end

    scenario 'display videos' do
      visit '/videos'
      expect(page).to have_content 'Kathryn Joseph \\\\ the bird (original)'
      expect(page).to have_selector('img')
      expect(page).not_to have_content('No videos added yet...')
    end
  end

  context 'adding videos' do
    scenario 'prompts user to fill out form, then adds a video to the homepage' do
      visit '/videos'
      click_link 'Add a video'
      fill_in 'Link', with: 'https://youtu.be/gId4LfQMqbQ'
      click_button 'Add Video'
      expect(page).to have_content 'Kathryn Joseph \\\\ the bird (original)'
      expect(page).to have_selector('img')
      expect(current_path).to eq '/videos'
    end
  end

  context 'viewing videos' do
    before do
      Video.create(link: 'https://youtu.be/gId4LfQMqbQ')
    end

    scenario 'allows a user to view a video on Youtube' do
      visit '/videos'
      find('.video-thumbnail').click
      expect(response).to redirect_to "https://www.youtube.com/watch?v=#{video.uid}"
    end
  end
end