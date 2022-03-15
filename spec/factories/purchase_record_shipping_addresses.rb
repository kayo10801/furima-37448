FactoryBot.define do
  factory :purchase_record_shipping_address do
   
    prefecture_id       {'2'}
    post_cord           {'123-4567'}
    city                {'大阪'} 
    address             {'1-1'}
    phone_number        {'00011112222'}
    building_name       {'メゾン'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
