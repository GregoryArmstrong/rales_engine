class Api::V1::Transactions::InvoicesController < Api::ApiController

  respond_to :json

  def index
    respond_with Transaction.find_invoices(params)
  end

end
