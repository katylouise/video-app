require 'rails_helper'

feature 'tagging' do
  scenario 'a user can add a single tag to a video' do
    create(:video)
    visit '/videos'
    click_link 'Tag video'
    fill_in 'Name', with: 'music'
    click_button 'Add Tag'
    expect(page).to have_content('music')
  end

  scenario 'a user can add multiple tags to a video' do
    video = create(:video)
    visit '/videos'
    click_link 'Tag video'
    fill_in 'Name', with: 'music scottish'
    click_button 'Add Tag'
    expect(page).to have_content('music scottish')
    expect(video.tags.map(&:name)).to eq(['music', 'scottish'])
  end

  context 'viewing tagged videos' do
    before do
      yoga_video = create(:yoga_video)
      kj_video = create(:video)
      kj_video.tags << tag = create(:music_tag)
      kj_video.save
      caribou_video = create(:caribou_video)
      caribou_video.tags << tag
      caribou_video.save
    end

    scenario 'a user can filter videos by their tags' do
      visit '/videos'
      fill_in 'search', with: 'music'
      click_button 'Search'
      expect(page).to have_css('img[src*="https://img.youtube.com/vi/#{video.uid}/mqdefault.jpg"]')
      expect(page).to have_css('img[src*="https://img.youtube.com/vi/#{caribou_video.uid}/mqdefault.jpg"]')
      expect(page).not_to have_css('img[src*="https://img.youtube.com/vi/#{yoga_video.uid}/mqdefault.jpg"]')
    end
  end
end