class KenAll::Row
  attr_reader :postcode, :prefecture_name, :city_name, :street_name, :city_code
  def initialize(row)
    @city_code = row[0]
    @postcode = row[2]
    @prefecture_name = row[6]
    @city_name = row[7]
    @street_name = row[8]
  end

  def to_h
    {
      postcode: postcode,
      prefecture_name: prefecture_name,
      city_name: city_name,
      street_name: street_name,
      city_code: city_code
    }
  end
end