class Api::V1::InvoicesrandomController < Api::ApiController

  respond_to :json

  def show
    respond_with Invoice.all.shuffle.first
  end

end
