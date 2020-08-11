FactoryBot.define do
  
  factory :item do 
    id                    {1}
    item_name             {"tomato"}
    item_introduction     {"good"}
    item_condition_id        {1}
    author                {"aaa"}
    auction_status        {1}
    postage_payer_id      {1}
    postage_type_id       {1}
    shipping_origin       {1}
    price                 {300}
    company               {"aaa"}
    preparation_id       {1}
    category_id           {1}
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end
  FactoryBot.use_parent_strategy = false
end