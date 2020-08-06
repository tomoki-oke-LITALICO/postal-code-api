class AddCityCodeToPostcodeData < ActiveRecord::Migration[6.0]
  def change
    add_column :postcode_data, :city_code, :string
  end
end
