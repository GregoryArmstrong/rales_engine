class Api::V1::FindMerchantsController < Api::ApiController

  respond_to :json

  def index
    respond_with Merchant.where('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Merchant.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.where(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Merchant.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Merchant.find_by('LOWER(name) = ?', params[:name].downcase) if params[:name]
    respond_with Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Merchant.find(params[:id]) if params[:id]
  end

end
