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
    scenario 'a user can filter videos by their tags' do

    end
  end
end