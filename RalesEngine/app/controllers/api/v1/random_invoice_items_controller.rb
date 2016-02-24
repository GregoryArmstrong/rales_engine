class Api::V1::RandomInvoiceItemsController < Api::ApiController

  respond_to :json

  def show
    respond_with InvoiceItem.all.shuffle.first
  end

end
