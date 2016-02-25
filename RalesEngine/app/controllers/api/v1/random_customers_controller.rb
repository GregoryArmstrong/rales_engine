class Api::V1::RandomCustomersController < Api::ApiController

  respond_to :json

  def show
    respond_with Customer.random
  end

end
