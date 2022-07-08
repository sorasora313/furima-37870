FactoryBot.define do
  factory :user do
    nickname {"タロウ"}
    email {Faker::Internet.free_email}
    password {"a11111"}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {"1999-10-13"}
  end
end