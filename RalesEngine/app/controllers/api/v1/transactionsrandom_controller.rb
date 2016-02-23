class Api::V1::TransactionsrandomController < Api::ApiController

  respond_to :json

  def show
    respond_with Transaction.all.shuffle.first
  end

end
