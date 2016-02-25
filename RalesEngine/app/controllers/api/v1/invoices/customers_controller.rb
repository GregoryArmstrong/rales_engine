class Api::V1::Invoices::CustomersController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.find_customers(params)
  end

end
