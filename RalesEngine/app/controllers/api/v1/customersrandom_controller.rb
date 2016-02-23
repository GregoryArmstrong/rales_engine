class Api::V1::CustomersrandomController < Api::ApiController

  respond_to :json

  def show
    respond_with Customer.all.shuffle.first
  end

end
