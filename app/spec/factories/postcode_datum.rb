FactoryBot.define do
    factory :postcode_datum do
      postcode { "0010011" }
      prefecture_name  { "北海道" }
      city_name { "札幌市北区" }
      street_name { "北11条" }
      is_disabled { false }
    end
end