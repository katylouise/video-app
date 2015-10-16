require 'rails_helper'

feature 'tagging' do
  xscenario 'a user can add a single tag when adding a video' do
    visit '/videos'
    click_link 'Add a video'
    fill_in 'Link', with: 'https://youtu.be/gId4LfQMqbQ'
    fill_in 'Tag', with: 'music'
    click_button 'Add Video'
    expect(page).to have_content('music')
  end
end