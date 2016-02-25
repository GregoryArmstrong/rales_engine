class Api::V1::InvoiceItems::InvoicesController < Api::ApiController

  respond_to :json

  def index
    respond_with InvoiceItem.find_invoices(params)
  end

end
