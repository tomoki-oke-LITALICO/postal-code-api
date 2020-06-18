class PostcodeDatum < ApplicationRecord
    include CsvParsable

    validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
    validates :prefecture_name, presence: true
    validates :city_name, presence: true
    validates :city_code, presence: true
end
