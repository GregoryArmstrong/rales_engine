class Api::V1::Items::InvoiceItemsController < Api::ApiController

  respond_to :json

  def index
    respond_with Item.find_invoice_items(params)
  end

end
