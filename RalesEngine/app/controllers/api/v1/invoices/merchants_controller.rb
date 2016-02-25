class Api::V1::Invoices::MerchantsController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.find_merchant(params)
  end

end
