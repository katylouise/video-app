require 'rails_helper'

feature 'tagging' do
  before do
    Video.create(link: 'https://youtu.be/gId4LfQMqbQ')
  end

  scenario 'a user can add a single tag to a video' do
    visit '/videos'
    click_link 'Tag video'
    fill_in 'Name', with: 'music'
    click_button 'Add Tag'
    expect(page).to have_content('music')
  end

  scenario 'a user can add multiple tags to a video' do
    visit '/videos'
    click_link 'Tag video'
    fill_in 'Name', with: 'music scottish'
    click_button 'Add Tag'
    expect(page).to have_content('music scottish')
  end
end