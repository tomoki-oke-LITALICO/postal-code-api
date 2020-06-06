require "csv"

describe PostcodeDatum, type: :model do
    describe 'バリデーション' do
        let(:postcode_datum) { create(:postcode_datum) }
        context 'postcode' do
            it 'nilの場合invalid' do
                postcode_datum.postcode = nil
                expect(postcode_datum.valid?).to be_falsey
            end

            it '数字ではない場合invalid' do
                postcode_datum.postcode = 'aaaaaaa'
                expect(postcode_datum.valid?).to be_falsey
            end

            it '7桁ではない場合invalid' do
                postcode_datum.postcode = '001001'
                expect(postcode_datum.valid?).to be_falsey
            end
        end
    end


    describe '.find_or_initialize_by_csv' do
        it "CSVをパースしてassign出来る" do
            CSV.foreach("spec/fixtures/csvs/sample.csv", encoding: "Shift_JIS:UTF-8") do |row|
                expect(PostcodeDatum.find_or_initialize_by_csv(row).postcode).to eq(row[2])
                expect(PostcodeDatum.find_or_initialize_by_csv(row).prefecture_name).to eq(row[6])
                expect(PostcodeDatum.find_or_initialize_by_csv(row).city_name).to eq(row[7])
                expect(PostcodeDatum.find_or_initialize_by_csv(row).street_name).to eq(row[8])
            end
        end
    end
end