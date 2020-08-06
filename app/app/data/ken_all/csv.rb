require 'csv'
require 'zip'

class KenAll::Csv
  KEN_ALL_CSV_URL = 'https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip'.freeze
  KEN_ALL_CSV_NAME = 'KEN_ALL.CSV'
  TMP_ZIP_PATH = '/tmp/ken_all.zip'
  TMP_CSV_PATH = '/tmp/ken_all.csv'

  def initialize(csv_path = TMP_CSV_PATH)
    @csv_path = csv_path
  end

  def foreach
    CSV.foreach(@csv_path)
  end
  
  class << self
    def fetch
      response = Faraday.get(KEN_ALL_CSV_URL)
      File.open(TMP_ZIP_PATH, 'w') do |f|
        f.write(response.body)
      end

      content = Zip::File.open(TMP_ZIP_PATH).read(KEN_ALL_CSV_NAME)
      File.open(TMP_CSV_PATH, 'w') do |f|
        f.write(content.encode(Encoding::UTF_8, Encoding::SHIFT_JIS))
      end

      new
    end
  end
end