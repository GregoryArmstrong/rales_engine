class Api::V1::Merchants::CustomersWithPendingInvoicesController < Api::ApiController

  respond_to :json

  def index
    respond_with Merchant.find_customers_with_pending_invoices(params)
  end

end
