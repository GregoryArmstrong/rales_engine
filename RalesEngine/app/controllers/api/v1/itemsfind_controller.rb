class Api::V1::ItemsfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Item.where(name: params[:name].downcase) if params[:name]
    respond_with Item.where(description: params[:description].downcase) if params[:description]
    respond_with Item.where(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Item.find_by(name: params[:name].downcase) if params[:name]
    respond_with Item.find_by(description: params[:description].downcase) if params[:description]
    respond_with Item.find_by(unit_price: params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Item.find(params[:id]) if params[:id]
  end

end
