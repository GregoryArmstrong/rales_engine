class Api::V1::InvoicesfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.where(customer_id: params[:customer_id].downcase) if params[:customer_id]
    respond_with Invoice.where(merchant_id: params[:merchant_id].downcase) if params[:merchant_id]
    respond_with Invoice.where(status: params[:status]) if params[:status]
    respond_with Invoice.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Invoice.find_by(customer_id: params[:customer_id].downcase) if params[:customer_id]
    respond_with Invoice.find_by(merchant_id: params[:merchant_id].downcase) if params[:merchant_id]
    respond_with Invoice.find_by(status: params[:status]) if params[:status]
    respond_with Invoice.find(params[:id]) if params[:id]
  end

end
