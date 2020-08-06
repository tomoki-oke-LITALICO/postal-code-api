class UpdateJob < ApplicationJob
  def import
    mini_batch = []

    KenAll::Csv.fetch.foreach.with_index do |row, index|
      postcode_datum_row = KenAll::Row.new(row).to_h
      mini_batch.append(postcode_datum_row)

      if index % 1000 == 1
        PostcodeDatum.insert_all(mini_batch)
        mini_batch = []
      end
    end

    PostcodeDatum.insert_all(mini_batch) unless mini_batch.empty?
  end
end
