class Api::V1::InvoicesfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.where(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.where(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.where('LOWER(status) = ?', params[:status].downcase) if params[:status]
    respond_with Invoice.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Invoice.where(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Invoice.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Invoice.find_by(customer_id: params[:customer_id]) if params[:customer_id]
    respond_with Invoice.find_by(merchant_id: params[:merchant_id]) if params[:merchant_id]
    respond_with Invoice.find_by('LOWER(status) = ?', params[:status].downcase) if params[:status]
    respond_with Invoice.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Invoice.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Invoice.find(params[:id]) if params[:id]
  end

end
