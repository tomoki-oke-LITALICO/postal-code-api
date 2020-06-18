class UpdateJob < ApplicationJob
  def import
    KenAll::Csv.fetch.foreach do |row|
      PostcodeDatum.create(row.to_h)
    end
  end
end
