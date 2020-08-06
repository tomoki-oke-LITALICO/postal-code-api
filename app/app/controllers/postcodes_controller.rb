require 'json'

class PostcodesController < ApplicationController
  def search
    postcode_data = PostcodeDatum.where(postcode: postcode_params[:postcode])

    postcode_data_json = postcode_data.to_json(
      only: [:prefecture_name, :city_name, :city_code]
    )

    render json: postcode_data_json
  end

  private

    def postcode_params
      params.permit(:postcode)
    end
end
