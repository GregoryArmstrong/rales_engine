class Api::V1::Items::MerchantsController < Api::ApiController

  respond_to :json

  def index
    item = Item.find(params[:item_id])
    respond_with item.merchant
  end

end
