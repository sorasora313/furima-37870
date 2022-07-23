FactoryBot.define do
  factory :order_form do
    post_code{'222-4444'}
    prefecture_id{2}
    city{'中根台'}
    address{'45-33'}
    building{'大ビル'}
    telephone{'09099999999'}
    user_id{FactoryBot.create(:user).id}
    item_id{FactoryBot.create(:item).id}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
