FactoryBot.define do
  factory :item do
    title             {"商品名"}
    description       {"商品説明"}
    price             {1000}
    category_id         {2}
    condition_id        {2}
    delivery_area_id    {2}
    delivery_charge_id  {2}
    delivery_day_id     {2}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
