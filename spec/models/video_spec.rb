require 'rails_helper'

RSpec.describe Video, type: :model do

  it { is_expected.to have_and_belong_to_many :tags  }

  it 'is not valid without a link' do
    video = build(:video, link: '')
    expect(video).not_to be_valid
  end

  it 'is expected to have a link in the correct format' do
    video = build(:video, link: 'ABC')
    expect(video).not_to be_valid
  end

end