class Api::V1::Customers::InvoicesController < Api::ApiController

  respond_to :json

  def index
    customer = Customer.find(params[:customer_id])
    respond_with customer.invoices
  end

end
