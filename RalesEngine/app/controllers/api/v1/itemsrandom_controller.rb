class Api::V1::ItemsrandomController < Api::ApiController

  respond_to :json

  def show
    respond_with Item.all.shuffle.first
  end

end
