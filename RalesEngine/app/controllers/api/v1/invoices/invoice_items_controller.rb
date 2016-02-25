class Api::V1::Invoices::InvoiceItemsController < Api::ApiController

  respond_to :json

  def index
    respond_with InvoiceItem.find_invoice_items(params)
  end

end
