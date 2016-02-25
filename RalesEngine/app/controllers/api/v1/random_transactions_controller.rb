class Api::V1::RandomTransactionsController < Api::ApiController

  respond_to :json

  def show
    respond_with Transaction.random
  end

end
