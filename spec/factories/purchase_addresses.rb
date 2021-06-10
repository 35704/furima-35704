FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    municipalities { 'さいたま市' }
    address_number { '1-1' }
    building_name { 'さいたまハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
