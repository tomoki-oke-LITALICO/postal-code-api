class AddCityCodeToPostcodeData < ActiveRecord::Migration[6.0]
  def up
    add_column :postcode_data, :city_code, :string
  end

  def down
    remove_column :postcode_data, :city_code, :string
  end
end
