class CreatePostcodeData < ActiveRecord::Migration[6.0]
  def change
    create_table :postcode_data do |t|
      t.string :postcode, index: true
      t.string :prefecture_name
      t.string :city_name
      t.string :street_name
      t.boolean :is_disabled, null: false, default: false

      t.timestamps
    end
  end
end
