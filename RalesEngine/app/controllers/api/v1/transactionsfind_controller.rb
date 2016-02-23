class Api::V1::TransactionsfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.where(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.where(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.where(result: params[:result]) if params[:result]
  end

  def show
    respond_with Transaction.find(params[:id]) if params[:id]
    respond_with Transaction.find_by(invoice_id: params[:invoice_id]) if params[:invoice_id]
    respond_with Transaction.find_by(credit_card_number: params[:credit_card_number]) if params[:credit_card_number]
    respond_with Transaction.find_by(result: params[:result].downcase) if params[:result]
  end
end
