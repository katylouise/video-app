require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to have_and_belong_to_many :videos }

  it 'has a unique name' do
    create(:music_tag)
    tag = Tag.new(name: 'music')
    expect(tag).to have(1).error_on(:name)
  end

end