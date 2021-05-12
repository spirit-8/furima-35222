FactoryBot.define do
  factory :purchase_buyer do
    zip_code {'123-4567'}
    prefecture_id {2}
    municipality {'東京都'}
    address {'世田谷区'}
    building {'ビル'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
