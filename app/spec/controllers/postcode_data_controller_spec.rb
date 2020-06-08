require "csv"
require 'json'

describe PostcodeDataController, type: :controller do
    before do
        CSV.foreach("spec/fixtures/csvs/sample.csv", encoding: "Shift_JIS:UTF-8") do |row|
            PostcodeDatum.find_or_initialize_by_csv(row).save
        end
    end

    it "200を返す" do
        get '/'
        expect(response.status).to eq 200
        pp response.body
    end

    it '該当する郵便番号がある場合データを返す' do
        get '/', query: { postcode: '0600000' }
        pp JSON.parse(response.body)
        expect(JSON.parse(response.body)['data'][0]['attributes']['prefecture_name']).to eq '北海道'
    end
end
