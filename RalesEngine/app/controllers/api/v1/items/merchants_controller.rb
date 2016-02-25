class Api::V1::Items::MerchantsController < Api::ApiController

  respond_to :json

  def index
    respond_with Item.find_merchant(params)
  end

end
