FactoryGirl.define do
  factory :tag do
    factory :music_tag do
      name 'music'
    end

    factory :dance_tag do
      name 'dance'
    end

    factory :scottish_tag do
      name 'scottish'
    end
  end
end