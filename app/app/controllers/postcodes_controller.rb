class PostcodesController < ApplicationController
  def search
    postcode_data = PostcodeDatum.where(postcode: postcode_params[:postcode])

    postcode_json = PostcodeDatumSerializer.new(postcode_data).serializable_hash
    render json: postcode_json
  end

  private

    def postcode_params
      params.permit(:postcode)
    end
end
