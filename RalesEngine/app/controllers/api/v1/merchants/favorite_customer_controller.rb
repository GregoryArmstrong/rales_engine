class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController

  respond_to :json

  def index
    invoices = Merchant.find_invoices(params)
    respond_with Customer.find((invoices.max_by { |k,v| v })[0])
  end

end
