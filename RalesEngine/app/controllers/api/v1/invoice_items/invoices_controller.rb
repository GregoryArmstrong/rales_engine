class Api::V1::InvoiceItems::InvoicesController < Api::ApiController

  respond_to :json

  def index
    invoice_item = InvoiceItem.find(params[:invoice_item_id])
    respond_with invoice_item.invoice
  end

end
