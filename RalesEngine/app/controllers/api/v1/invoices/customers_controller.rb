class Api::V1::Invoices::CustomersController < Api::ApiController

  respond_to :json

  def index
    invoice = Invoice.find(params[:invoice_id])
    respond_with invoice.customer
  end

end
