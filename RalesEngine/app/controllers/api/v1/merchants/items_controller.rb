class Api::V1::Merchants::ItemsController < Api::ApiController

  respond_to :json

  def index
    respond_with Item.find_merchants(params)
  end

end
