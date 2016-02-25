class Api::V1::Customers::FavoriteMerchantController < Api::ApiController

  respond_to :json

  def index
    customer = Customer.find(params[:customer_id])
    invoices = customer.invoices.successful.select("merchant_id").group("merchant_id").count
    winner = (invoices.max_by { |k,v| v })[0]
    final = { id: winner, name: Merchant.find(winner).name }
    respond_with final
  end

end
