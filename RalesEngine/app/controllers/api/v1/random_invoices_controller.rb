class Api::V1::RandomInvoicesController < Api::ApiController

  respond_to :json

  def show
    respond_with Invoice.random
  end

end
