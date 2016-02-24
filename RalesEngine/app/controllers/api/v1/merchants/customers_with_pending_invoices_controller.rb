class Api::V1::Merchants::CustomersWithPendingInvoicesController < Api::ApiController

  respond_to :json

  def index
    merchant = Merchant.find(params[:merchant_id])
    invoices = merchant.invoices.failed.uniq

    respond_with invoices.count
  end

end
