class Api::V1::RandomMerchantsController < Api::ApiController

  respond_to :json

  def show
    respond_with Merchant.all.shuffle.first
  end

end
