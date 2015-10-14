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
      Video.create(link: 'https://youtu.be/gId4LfQMqbQ', title: 'Kathryn Joseph - The Bird')
    end

    scenario 'display videos' do
      visit '/videos'
      expect(page).to have_content 'Kathryn Joseph - The Bird'
      expect(page).to have_selector('img')
    end
  end

  context 'adding videos' do
    scenario 'prompts user to fill out form, then adds a video to the homepage' do
      visit '/videos'
      click_link 'Add a video'
      fill_in 'Link', with: 'https://youtu.be/gId4LfQMqbQ'
      fill_in 'Title', with: 'Kathryn Joseph - The Bird'
      click_button 'Add Video'
      expect(page).to have_content 'Kathryn Joseph - The Bird'
      expect(page).to have_selector('img')
      expect(current_path).to eq '/videos'
    end
  end
end