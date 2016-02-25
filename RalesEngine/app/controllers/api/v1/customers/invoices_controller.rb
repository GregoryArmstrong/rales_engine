class Api::V1::Customers::InvoicesController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.find_invoices(params)
  end

end
