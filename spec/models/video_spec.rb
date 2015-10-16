require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'is not valid without a link' do
    video = Video.new(title: 'ABC')
    expect(video).not_to be_valid
  end

  it 'is expected to have a link in the correct format' do
    video = Video.new(link: 'ABC')
    expect(video).not_to be_valid
  end
end