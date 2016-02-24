class Api::V1::Customers::TransactionsController < Api::ApiController

  respond_to :json

  def index
    transacts = []
    invoices = Invoice.where(customer_id: params[:customer_id])
    invoices.each do |invoice|
      transacts << invoice.transactions[0] unless invoice.transactions.empty?
    end
    respond_with transacts
  end

end
