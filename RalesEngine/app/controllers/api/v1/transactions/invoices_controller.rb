class Api::V1::Transactions::InvoicesController < Api::ApiController

  respond_to :json

  def index
    transaction = Transaction.find(params[:transaction_id])
    respond_with transaction.invoice
  end

end
