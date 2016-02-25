class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController

  respond_to :json

  def index
    merchant = Merchant.find(params[:merchant_id])
    invoices = merchant.invoices.successful.select("customer_id").group("customer_id").count
    winner = (invoices.max_by { |k,v| v })[0]
    respond_with Customer.find(winner)
  end

end
