FactoryGirl.define do
  factory :video do
    link 'https://www.youtube.com/watch?v=gId4LfQMqbQ'

    factory :yoga_video do
      link 'https://www.youtube.com/watch?v=oBu-pQG6sTY'
    end

    factory :caribou_video do
      link 'https://www.youtube.com/watch?v=BI2Et19vDCM'
    end
  end
end