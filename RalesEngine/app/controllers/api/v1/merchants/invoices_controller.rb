class Api::V1::Merchants::InvoicesController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.find_merchants(params)
  end

end
