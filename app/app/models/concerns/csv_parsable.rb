module CsvParsable
    extend ActiveSupport::Concern

    class_methods do
        def parse_csv_row(row)
            {
                postcode: row[2],
                prefecture_name: row[6],
                city_name: row[7],
                street_name: row[8]
            }
        end

        def find_or_initialize_by_csv(row)
            find_or_initialize_by(self.parse_csv_row(row))
        end
    end
end