class PostcodeDatumSerializer
    include FastJsonapi::ObjectSerializer
    set_type :postcode
    attributes :prefecture_name, :city_name
end