FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end

    name{"あいうえお"}
    explain{"いい"}
    category_id{2}
    condition_id{2}
    charge_id{2}
    prefecture_id{2}
    schedule_day_id{2}
    price{"400"}
  end
end