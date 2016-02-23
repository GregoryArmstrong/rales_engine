class Api::V1::MerchantsfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Merchant.where(name: params[:name].downcase) if params[:name]
    respond_with Merchant.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Merchant.find_by(name: params[:name].downcase) if params[:name]
    respond_with Merchant.find(params[:id]) if params[:id]
  end

end
