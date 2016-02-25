class Api::V1::Customers::FavoriteMerchantController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.favorite_merchant(params)
  end

end
