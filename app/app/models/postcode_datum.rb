class PostcodeDatum < ApplicationRecord
    include CsvParsable

    validates :postcode, presence: true
end
