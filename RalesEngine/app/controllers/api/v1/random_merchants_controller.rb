class Api::V1::RandomMerchantsController < Api::ApiController

  respond_to :json

  def show
    respond_with Merchant.random
  end

end
