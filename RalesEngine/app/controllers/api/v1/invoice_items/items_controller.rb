class Api::V1::InvoiceItems::ItemsController < Api::ApiController

  respond_to :json

  def index
    respond_with InvoiceItem.find_items(params)
  end

end
