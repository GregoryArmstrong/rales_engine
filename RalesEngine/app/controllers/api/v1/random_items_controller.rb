class Api::V1::RandomItemsController < Api::ApiController

  respond_to :json

  def show
    respond_with Item.all.shuffle.first
  end

end
