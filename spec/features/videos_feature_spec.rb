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
      create(:video)
    end

    scenario 'display videos' do
      visit '/videos'
      expect(page).to have_content 'Kathryn Joseph \\\\ the bird (original)'
      expect(page).to have_selector 'img'
      expect(page).not_to have_content 'No videos added yet...'
    end
  end

  context 'adding videos' do
    scenario 'prompts user to fill out form, then adds a video to the homepage' do
      visit '/videos'
      click_link 'Add a video'
      fill_in 'Link', with: 'https://youtu.be/gId4LfQMqbQ'
      click_button 'Add Video'
      expect(page).to have_content 'Video added!'
      expect(page).to have_content 'Kathryn Joseph \\\\ the bird (original)'
      expect(page).to have_selector 'img'
      expect(current_path).to eq '/videos'
    end
  end

  context 'viewing videos' do
    before do
      Capybara.current_driver = :selenium
      visit '/videos'
      click_link 'Add a video'
      fill_in 'Link', with: 'https://youtu.be/gId4LfQMqbQ'
      click_button 'Add Video'
    end

    scenario 'allows a user to view a video on Youtube' do
      find('.video-thumbnail').click
      within_window(switch_to_window(windows.last)) do
        expect(current_url).to eq "https://www.youtube.com/watch?v=gId4LfQMqbQ"
      end
      Capybara.use_default_driver
    end
  end

  context 'deleting videos' do
    scenario 'removes a video when a user clicks the delete link' do
      visit '/videos'
      click_link 'Delete video'
      expect(page).to have_content 'Video deleted'
      expect(page).not_to have_content 'Kathryn Joseph \\\\ the bird (original)'
      expect(page).not_to have_selector 'img'
    end
  end

  context 'viewing tagged videos' do
    # before do

    # end

    scenario 'a user can filter videos by their tags' do
      yoga_video = create(:yoga_video)
      video = create(:video)
      video.tags << tag = create(:music_tag)
      video.save
      caribou_video = create(:caribou_video)
      caribou_video.tags << tag
      caribou_video.save
      visit '/videos'
      fill_in 'search', with: 'music'
      click_button 'Search'
      expect(page.has_image?(src: "https://img.youtube.com/vi/#{video.uid}/mqdefault.jpg")).to be(true)
      expect(page.has_image?(src: "https://img.youtube.com/vi/#{caribou_video.uid}/mqdefault.jpg")).to be(true)
      expect(page.has_image?(src: "https://img.youtube.com/vi/#{yoga_video.uid}/mqdefault.jpg")).to be(false)
    end
  end
end