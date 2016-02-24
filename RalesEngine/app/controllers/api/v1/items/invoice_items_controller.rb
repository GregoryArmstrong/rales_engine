class Api::V1::Items::InvoiceItemsController < Api::ApiController

  respond_to :json

  def index
    item = Item.find(params[:item_id])
    respond_with item.invoice_items
  end

end
